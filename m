Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED57DC98310
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 03:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2oKEtCF+QGape9hZi3aipVogW0XzVmMzvZ+3qHbSo6M=; b=PtLQivNVEnYgBS
	B8pm09XX5E1KOSOzGMnzUDZjxPR8syNuxoLcB9Ta6vQ/8Nif6NErVJ+CNAVMKZeIAEsZT47/a0ZMP
	aoJQpzek0v1yxj3ossZO+s0+hnXhMM0Jbc3tDwqxvA52pCKXY9N4M8WL5kTt46wpPn5oa5n/lzytM
	SV3LPvflfAW2UWe5m6H6LnZfKhJeQyizemWmei9r7dP/zZ5sEUuf9x+BBubi5hCwaJiId2Iz2XmNZ
	z+RBv+Us6gi24oQRPnVQM9a8j1EyyuwBA5KgtlThU/8mbIKnLrW9A6qUgBlAE0/9miw7tAvfGOfIR
	Gbp0+MWKDvp+M79z3EOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9aJa-00000009xaL-2kfs;
	Thu, 24 Sep 2026 03:40:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9aJZ-00000009xYt-03m6
	for kvm-riscv@bombadil.infradead.org;
	Thu, 24 Sep 2026 03:40:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=A+/F+EwP6gEMu0jRCxTda03GH84HVKp/PE6q27DJ7A0=; b=Litp+X5pTayy6NmOYRWtWuKwTm
	4VJRTqSgywbJVkPEVb5iWR5YB0WjpfDsVcX4TfnAPLlgfLa8Z/Eop/o9JCr6w+gRlc90KPzq8xZr8
	cJjNqg99mlFCr98OVOI0s01ZrBAsQ9AsbIhZhvsOtkmMZcWej+dzyfrmmhYwS1BJPkXsxz3oJ7u/C
	1pEiBYRx967spKcruqSSTVDLsJbRz0MSsy69JZW0EQQjTbPfalqwD+xgzZoKoPFcyHa57+Fpd1tR7
	u2uGcmXMuNQka79V+6bdsVgaj0FbxOC0VZxbnUojkNGP0fdRQJS5MZzG0XZCneccGwhZFKGixL2NN
	0HOGCOsA==;
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9aJR-0000000FVSr-1yJC
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 03:40:01 +0000
Received: from localhost (unknown [122.194.100.201])
	by APP-01 (Coremail) with SMTP id qwCowAA3D_OGm7Rq707JCA--.1196S2;
	Thu, 24 Sep 2026 11:39:50 +0800 (CST)
From: Xiang W <wangxiang@iscas.ac.cn>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: andrew.jones@linux.dev,
	pbonzini@redhat.com,
	thuth@redhat.com,
	Xiang W <wangxiang@iscas.ac.cn>
Subject: [kvm-unit-tests PATCH 1/7] riscv: Initialize the ACPI RSDP from the EFI system table
Date: Thu, 24 Sep 2026 11:39:39 +0800
Message-ID: <20260924033945.176581-2-wangxiang@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924033945.176581-1-wangxiang@iscas.ac.cn>
References: <20260924033945.176581-1-wangxiang@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowAA3D_OGm7Rq707JCA--.1196S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFy3Ar45Wr47Jr4fKFyUKFg_yoW8CFyUpa
	yYyFW5GrW8GrWxJ3sayr1jk343Ar4SgFy7J397Aan8Aa15ZrWDZF1kta4avF13XFyrta1Y
	qan29ryrWan0y3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r126r1DMxkIecxEwVAFwVW8GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x0JUIPfdUUUUU=
X-Originating-IP: [122.194.100.201]
X-CM-SenderInfo: pzdqw5pldqwq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_043958_614817_A4705D9C 
X-CRM114-Status: GOOD (  10.23  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

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
