Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD46606A31E
	for <kvm-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 01:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uW4ehCyI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2oKEtCF+QGape9hZi3aipVogW0XzVmMzvZ+3qHbSo6M=; b=uW4ehCyI8DZCQK3srEUg0QviWg
	GYeYuvDhASHyWak6tMu87FM3uD433fDaTXgDqzVGRYSGs82VJiGJ4eDjG9r6piXHZp23CxaKzsVKR
	WjWF6BQ7W0pG6zZTNVrLJjCQgPULGa4uEMTXgdJ/CjAFxWV791WhL9DFsRTUW9sNBTRBTsdhAlOXL
	LLgA/S8Wq1lMsaOgR2/Y/B99D5uGV9Zmje0hAh2oiXS4HgW0k+g1S36kPH7JscJhr2pkkNb5coiig
	wSPv3lis57H3ZkWKi9vnhhTrzunxleK0oiAQZ2DsS4OPuuCFOYk4o8jTe71sHTltpgt2RvAeVoxCj
	t3LoIZTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW23k-00000008CoX-3RCA;
	Wed, 25 Nov 2026 01:44:32 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW23h-00000008Cn9-26ew
	for kvm-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 01:44:31 +0000
Received: from localhost (unknown [122.194.100.240])
	by APP-03 (Coremail) with SMTP id rQCowAC3vI15PQZrptm8AQ--.779S2;
	Wed, 25 Nov 2026 09:44:25 +0800 (CST)
From: Xiang W <wangxiang@iscas.ac.cn>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: andrew.jones@linux.dev,
	Xiang W <wangxiang@iscas.ac.cn>,
	pbonzini@redhat.com,
	thuth@redhat.com
Subject: [kvm-unit-tests PATCH v3 1/9] riscv: Initialize the ACPI RSDP from the EFI system table
Date: Wed, 25 Nov 2026 09:44:01 +0800
Message-ID: <20261125014409.79852-2-wangxiang@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125014409.79852-1-wangxiang@iscas.ac.cn>
References: <20261125014409.79852-1-wangxiang@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: rQCowAC3vI15PQZrptm8AQ--.779S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFy3Ar45Wr47Jr4fKFyUKFg_yoW8CFyUpa
	yYyFW5GrW8GrWxJ3sayr1jk343Ar4SgFy7J397Aan8Aa15ZrWDZF1kta4avF13XFyrta1Y
	qan29ryrWan0y3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
	WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AF
	wI0_JF0_Jw1lc2xSY4AK67AK6w4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
	73UjIFyTuYvjfUYHqcUUUUU
X-CM-SenderInfo: pzdqw5pldqwq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_174429_926218_57E1AA18 
X-CRM114-Status: GOOD (  10.34  )
X-Spam-Score: -4.2 (----)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On EFI boots without a DT, ACPI table lookup needs a valid RSDP.
Fetch the ACPI 2.0 table from the EFI configuration table and
register it with set_efi_rsdp() before cpu_init() and
timer_get_frequency().

The RSDP lives in EFI_ACPI_RECLAIM_MEMORY, which the RISC-V
allocator does not reuse, so there is no need to copy it aside.

Signed-off-by: Xiang W <wangxiang@iscas.ac.cn>
---
 lib/riscv/setup.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/lib/riscv/setup.c b/lib/riscv/setup.c
index a30aa0c4..8c22120d 100644
--- a/lib/riscv/setup.c
+++ b/lib/riscv/setup.c
@@ -226,10 +226,31 @@ void setup(const void *fdt, phys_addr_t freemem_start)
 
 #ifdef CONFIG_EFI
 #include <efi.h>
+#include <acpi.h>
 
 extern unsigned long exception_vectors;
 extern unsigned long boot_hartid;
 
+static efi_status_t setup_rsdp(efi_bootinfo_t *efi_bootinfo __unused)
+{
+	efi_status_t status;
+	struct acpi_table_rsdp *rsdp;
+
+	/*
+	 * RSDP resides in an EFI_ACPI_RECLAIM_MEMORY region, which is not used
+	 * by kvm-unit-tests RISC-V memory allocator. So it is not necessary to
+	 * copy the data structure to another memory region to prevent
+	 * unintentional overwrite.
+	 */
+	status = efi_get_system_config_table(ACPI_20_TABLE_GUID, (void **)&rsdp);
+	if (status != EFI_SUCCESS)
+		return status;
+
+	set_efi_rsdp(rsdp);
+
+	return EFI_SUCCESS;
+}
+
 static efi_status_t efi_mem_init(efi_bootinfo_t *efi_bootinfo)
 {
 	struct mem_region *freemem_mr = NULL, *code, *data;
@@ -273,6 +294,14 @@ efi_status_t setup_efi(efi_bootinfo_t *efi_bootinfo)
 		return status;
 	}
 
+	if (!dt_available()) {
+		status = setup_rsdp(efi_bootinfo);
+		if (status != EFI_SUCCESS) {
+			printf("Cannot find RSDP in EFI system table\n");
+			return status;
+		}
+	}
+
 	cpu_init();
 	timer_get_frequency();
 	thread_info_init();
-- 
2.47.3


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
