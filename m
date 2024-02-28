From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 28 Feb 2024 16:04:25 +0100
Subject: [kvm-unit-tests PATCH 09/13] efi: Add support for obtaining the boot hartid
In-Reply-To: <20240228150416.248948-15-andrew.jones@linux.dev>
References: <20240228150416.248948-15-andrew.jones@linux.dev>
Message-ID: <20240228150416.248948-24-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

riscv needs to use an EFI protocol to get the boot hartid.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/efi.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/lib/efi.c b/lib/efi.c
index edfcc80ef114..77cfbfac50ed 100644
--- a/lib/efi.c
+++ b/lib/efi.c
@@ -29,6 +29,31 @@ extern int main(int argc, char **argv, char **envp);
 
 efi_system_table_t *efi_system_table = NULL;
 
+#ifdef __riscv
+#define RISCV_EFI_BOOT_PROTOCOL_GUID EFI_GUID(0xccd15fec, 0x6f73, 0x4eec,  0x83, 0x95, 0x3e, 0x69, 0xe4, 0xb9, 0x40, 0xbf)
+
+unsigned long boot_hartid;
+
+struct riscv_efi_boot_protocol {
+	u64 revision;
+	efi_status_t (*get_boot_hartid)(struct riscv_efi_boot_protocol *,
+		      unsigned long *boot_hartid);
+};
+
+static efi_status_t efi_get_boot_hartid(void)
+{
+	efi_guid_t boot_protocol_guid = RISCV_EFI_BOOT_PROTOCOL_GUID;
+	struct riscv_efi_boot_protocol *boot_protocol;
+	efi_status_t status;
+
+	status = efi_bs_call(locate_protocol, &boot_protocol_guid, NULL,
+			     (void **)&boot_protocol);
+	if (status != EFI_SUCCESS)
+		return status;
+	return efi_call_proto(boot_protocol, get_boot_hartid, &boot_hartid);
+}
+#endif
+
 static void efi_free_pool(void *ptr)
 {
 	efi_bs_call(free_pool, ptr);
@@ -422,6 +447,14 @@ efi_status_t efi_main(efi_handle_t handle, efi_system_table_t *sys_tab)
 		goto efi_main_error;
 	}
 
+#ifdef __riscv
+	status = efi_get_boot_hartid();
+	if (status != EFI_SUCCESS) {
+		printf("Failed to get boot haritd\n");
+		goto efi_main_error;
+	}
+#endif
+
 	/* 
 	 * Exit EFI boot services, let kvm-unit-tests take full control of the
 	 * guest
-- 
2.43.0


