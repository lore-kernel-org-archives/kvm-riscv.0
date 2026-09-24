Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DCFC98312
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 03:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PVR66Zzuh/oSbpVnVNr+lTm5x1kYI8UNWU1sD/koe4o=; b=UZy/yslabpcrmd
	y98thT2ShOOW/kBc51Gri9f0I4F7VIAmphz/oUcSzpHy0q5iP9uZaeP0YIoaWiMWaAjAZ8JFCnVIm
	GNswoCv+W2N8X8oaDDwxfWIFmMUK5Y3xUKjvYutPvJnUAF3Ui6d99wpMRe6em7KBffAtBhTMarRwY
	XRp8cdVrVn/F+HjchBXVB/ETG0dZwvYWJdAlUYneTFKeUt+vRG2YEzxNh3XU+6xiv1E4qhPKIKb8j
	eqVQajgjh5/UaioS1f23vC88VPAUy6hr8QxFpynW7LRTfxeDsks+kxK8YFqSZIzRHcz22ouugdSKD
	eg23j4e6B+tPsyuxtQOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9aJa-00000009xaT-2whx;
	Thu, 24 Sep 2026 03:40:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9aJZ-00000009xYv-0OJg
	for kvm-riscv@bombadil.infradead.org;
	Thu, 24 Sep 2026 03:40:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=8zXArfsll28iyzuQ1lG8GXky8Vq4O6bzJfkHBrHbeD0=; b=Akb93crrtCURjh6YcurXx6YxeH
	jfcI/F5Qw85GXJ9OEmCt/r6GgF3KOXsB0hagNTjP9zVQKcha44lh17fdDtUA5GeZYrHyDV5lvWpat
	RRSeXur1M1TkKesZbxQC1zhiuIv71SrX+7RbYdBvE2dIKq/h2ehv5b060FoZm4HecEaLPmBQzKsrl
	KT2TfG9Hi0jHnlwKVeKoB+Y4a/ewy2AxS3chIgS0pjjLo5tBAtA+rjgX1VThIG9pxpo8tC8oYIxaH
	oMSmmfV4f4BZIhTAL4KxL/OYXANi19+Bx5hj7f46BuzGhcsyN96UoeSo5npPy3dpFpjSucKV5U7MO
	z6ds8/IQ==;
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9aJS-0000000FVSw-1AfZ
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 03:40:02 +0000
Received: from localhost (unknown [122.194.100.201])
	by APP-01 (Coremail) with SMTP id qwCowAA3Cu6Im7RqGU_JCA--.41621S2;
	Thu, 24 Sep 2026 11:39:52 +0800 (CST)
From: Xiang W <wangxiang@iscas.ac.cn>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: andrew.jones@linux.dev,
	pbonzini@redhat.com,
	thuth@redhat.com,
	Xiang W <wangxiang@iscas.ac.cn>
Subject: [kvm-unit-tests PATCH 6/7] riscv: efi: Allow ACPI boots
Date: Thu, 24 Sep 2026 11:39:44 +0800
Message-ID: <20260924033945.176581-7-wangxiang@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924033945.176581-1-wangxiang@iscas.ac.cn>
References: <20260924033945.176581-1-wangxiang@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowAA3Cu6Im7RqGU_JCA--.41621S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtr1DtF18CrWxur1fGr1UGFg_yoWfArb_Cr
	Z7Aa97ZryYqFZrA3WUJrn5tF1rGws3Wr1DZF4UKF4jk34xWF1Yk3yvkr18A3WrAFyDGrn2
	kanrJay7Gw4kGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbsAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1lc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7VUUZ2-5UUUUU==
X-Originating-IP: [122.194.100.201]
X-CM-SenderInfo: pzdqw5pldqwq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_043959_182351_6369E0A8 
X-CRM114-Status: UNSURE (   5.83  )
X-CRM114-Notice: Please train this message.
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

riscv/efi/run rejected EFI_USE_ACPI=y because CPU, timer and ISA
discovery aborted without a DT. Those paths can now walk MADT and
RHCT, so drop the early exit.

The existing runner already omits -machine acpi=off when
EFI_USE_ACPI=y. QEMU virt defaults to ACPI enabled, so no extra
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
