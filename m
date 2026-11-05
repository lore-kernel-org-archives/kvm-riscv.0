Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05D7606A326
	for <kvm-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 08:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xIXsK5Eq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ulLhQZCA/ZEGryd28d9SB4ZvE3MILF867DUOQ5+YlXM=; b=xIXsK5EqHKa5l3LYAWLcP09mvg
	4jbj1raocASMfkjVyxIuWUkdceTfy77U8fUbITl6hqTliB02UTVW7XWOh53Gl6tJ6q4LhOBv2oaNO
	GVLqkWM3HWBplbmASnHn9CMvgMjk6NVpIfW0CbJClorUyU+F3i2pga8TVHNmbUVFDaEh8ZRL5nWYw
	xgq3sERIe2Y1tVAgJBGJwaslnwWHD2yPTLISjPBzX0pQ8oUQDZ2hcVX0jR4ihPVr+UX9iumJq9bGW
	ckPCsRFG78aEU1bIPE9LnANwBKX6I8nQeZYueErBPR+EUNEOdoGzqLh3lPa2MdYbUPmvs+uIb1dMe
	WSMYm4gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsiN-000000088dZ-2lOG;
	Thu, 05 Nov 2026 08:20:55 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsiC-000000088WJ-1YJ9
	for kvm-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 08:20:55 +0000
Received: from localhost (unknown [122.194.100.204])
	by APP-01 (Coremail) with SMTP id qwCowAAHL_laPOxq5idRAA--.3347S2;
	Thu, 05 Nov 2026 16:20:42 +0800 (CST)
From: Xiang W <wangxiang@iscas.ac.cn>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: andrew.jones@linux.dev,
	Xiang W <wangxiang@iscas.ac.cn>,
	pbonzini@redhat.com,
	thuth@redhat.com
Subject: [kvm-unit-tests PATCH v2 6/8] riscv: efi: Allow ACPI boots
Date: Thu,  5 Nov 2026 16:20:33 +0800
Message-ID: <20261105082035.133680-7-wangxiang@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105082035.133680-1-wangxiang@iscas.ac.cn>
References: <20261105082035.133680-1-wangxiang@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: qwCowAAHL_laPOxq5idRAA--.3347S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtr1DtF18CrWxur1fGr1UGFg_yoWfArc_Cr
	Z7Aa97ZryYqFZrA3WDJrn5tF1rGws3Wr1DZF4UKF4jk34xWF1Yk3yqkr18A3WrAFyDGrn2
	kwsrJay7Gw4kGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbsxFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxkIecxEwVAFwVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x0JU29a9UUUUU=
X-CM-SenderInfo: pzdqw5pldqwq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_002049_339910_C9BBA7FE 
X-CRM114-Status: UNSURE (   5.68  )
X-CRM114-Notice: Please train this message.
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

riscv/efi/run rejected EFI_USE_ACPI=y because CPU, timer and ISA
discovery aborted without a DT. Those paths can now walk MADT and
RHCT, so drop the early exit.

The existing runner already omits -machine acpi=off when
EFI_USE_ACPI!=y. QEMU virt defaults to ACPI enabled, so no extra
acpi=on flag is required. DT boots are unchanged: they still pass
acpi=off.

Tested with:

  EFI_USE_ACPI=y EFI_UEFI=/path/to/RISCV_VIRT_CODE.fd \
    ./riscv/efi/run riscv/riscv-brs.efi

Signed-off-by: Xiang W <wangxiang@iscas.ac.cn>
---
 riscv/efi/run | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/riscv/efi/run b/riscv/efi/run
index b9b75440..a53b3a2c 100755
--- a/riscv/efi/run
+++ b/riscv/efi/run
@@ -39,11 +39,6 @@ if [ ! -f "$EFI_UEFI" ]; then
 	exit 2
 fi
 
-if [ "$EFI_USE_ACPI" = "y" ]; then
-	echo "ACPI not available"
-	exit 2
-fi
-
 # Remove the TEST_CASE from $@
 shift 1
 
-- 
2.47.3


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
