using UnityEngine;
using UnityEngine.UI;

public class ConversationProperties : MonoBehaviour
{
	public InputField conversationId;
	public InputField conversationTitle;
	public Button graphicsButton;
	public InputField textenField;
	public Button addWorkshopConvButton;
	public Button uploadWorkshopConvButton;
	public Button generateLocKeys;
	public Button publishConversation;
	public GameObject emptyImage;
	public Image conversationGraphics;
	public DialogProperties[] allPropertiesTab;
	public Dropdown callTypeDropdown;
	public Dropdown POIDropDown;
	public Toggle cityCentreToggle;
}
