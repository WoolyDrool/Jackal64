using Project.Runtime.Gameplay.Inventory;
using Project.Runtime.Gameplay.Tools;
using Project.Runtime.Global;
using Project.Runtime.UI.Elements;
using UnityEngine;

namespace Project.Runtime.Gameplay.Interactables
{
    public class InteractableTrashDeposit : MonoBehaviour
    {
        [Header("Container Settings")]
        public bool isInfinite = false;

        public bool isFull = false;
        public float TrashCapacityMax;
        public int maxItemDepositSize;
        public float TrashCapacityCurrent;
        
        [Header("Interaction Settings")]
        public string interactableMessage;
        public AudioClip largeDepositSound;
        public AudioClip smallDepositSound;

        #region Internal Variables
        private RangerInventory playerInventory;
        private Interactable _interactable;
        private RuntimeTrailManager _manager;
        private AudioSource _source;
        private Coroutine depositRoutine;
        #endregion
        
        void Start()
        {
            //Get components
            playerInventory = GameManager.instance.playerInventory;
            _interactable = GetComponent<Interactable>();
            _manager = FindObjectOfType<RuntimeTrailManager>();
            _source = GetComponent<AudioSource>();
            
            //Reset current items
            TrashCapacityCurrent = 0;
            UpdateInteract();
        }
        
        void UpdateInteract()
        {
            const string defaultText = "Deposit";

            _interactable.description = $"{defaultText} ({TrashCapacityCurrent}/{TrashCapacityMax})";
        }

        public void Update()
        {
            if (isInfinite)
            {
                _interactable.description = interactableMessage + playerInventory.RangerGarbageCurrent+ ")";
            }
        }

        public void DetermineDeposit()
        {
            //var weightToAdd = playerInventory.playerWeightCurrent * 0.1f;
            if (isInfinite)
            {
                var sum = playerInventory.RangerGarbageCurrent + playerInventory.RangerRecycleCurrent;
                _manager.AddScore(sum);
                playerInventory.RangerGarbageCurrent = 0;
                playerInventory.RangerRecycleCurrent = 0;
            }
            else
            {
                if (playerInventory.RangerGarbageCurrent > 0)
                {
                    if (!isFull)
                    {
                        if (TrashCapacityCurrent + 1 !<= TrashCapacityMax)
                        {
                            playerInventory.RangerGarbageCurrent--;
                            TrashCapacityCurrent++;
                            _manager.AddScore(1);
                        }
                    }
                    else
                    {
                        UIAlertUpdate.alert.AddAlertMessage(AlertType.GENERAL, "Trash can full!");
                    }
                }
                else
                {
                    UIAlertUpdate.alert.AddAlertMessage(AlertType.GENERAL, "No Trash!");
                }
            }
            
            isFull = TrashCapacityCurrent >= TrashCapacityMax;
            UpdateInteract();
        }
        
        public void DepositSome()
        {
            /*for (int i = 0; i < playerInventory.playerCurrentTrash; i++)
            {
                int itemWeight = 
                if (itemWeight <= maxItemDepositSize)
                {
                    if (currentItems < itemsThatCanBeDeposited)
                    {
                        PlaySound(1);
                        currentItems++;
                        playerInventory.RemoveItem(itemToRemove);
                        _manager.AddScore(1);
                        return;
                    }
                    else
                    {
                        UIAlertUpdate.alert.AddAlertMessage(AlertType.TRASHFULL, "Trash can full!");
                    }
                }
                else
                {
                    UIAlertUpdate.alert.AddAlertMessage(AlertType.GENERAL, "Item too big!");
                    Debug.Log("Cant deposit item, item is too big!");
                }
            }*/

            _source.clip = null;
        }

        // private void FullDeposit()
        // {
        //     PlaySound(playerInventory.trashInInventory);
        //     
        //     _manager.AddScore(playerInventory.trashInInventory);
        //     playerInventory.ClearAllTrash();
        //     
        //     _source.clip = null;
        // }
        
        private void OnTriggerEnter(Collider other)
        {
            if (other.TryGetComponent(out InteractableThrowableItem throwableItem))
            {
                DepositThrownItem(throwableItem);
            }
        }
        
        private void DepositThrownItem(InteractableThrowableItem throwableItem)
        {
            if (!throwableItem.isBeingHeld && !throwableItem.hasBeenDeposited)
            {
                switch (isInfinite)
                {
                    case true:
                    {
                        throwableItem.hasBeenDeposited = true;
                        _manager.AddScore(throwableItem.amount);
                        Destroy(throwableItem.gameObject);
                        PlaySound(throwableItem.amount);
                        break;
                    }
                    case false:
                    {
                        if (TrashCapacityCurrent + throwableItem.amount <= TrashCapacityMax)
                        {
                            TrashCapacityCurrent += throwableItem.amount;
                            _manager.AddScore(throwableItem.amount);
                            Destroy(throwableItem.gameObject);
                            PlaySound(throwableItem.amount);
                        }
                        else
                        {
                            UIAlertUpdate.alert.AddAlertMessage(AlertType.GENERAL, "Trash can full!");
                        }
                        break;
                    }
                }
                
                UpdateInteract();
            }
        }
        
        private void PlaySound(int depositSize)
        {
            if(depositSize < 6)
            {
                _source.PlayOneShot(smallDepositSound);
            }
            else
            {
                _source.PlayOneShot(largeDepositSound);
            }
        }
        
    }

}