Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44774E85375
	for <kvm-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 15:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cLxKVBxcaxF7YL8NCkoZftmVqO25ubrNMqO6XpRJBjA=; b=yk5+vJDhpSAfp9
	I5wupCpDlcRS/roQ4CkZF4gtgkNG97y6oRCAChISNiuBHT0orQSb18h4HF/LhhGsq7ac/JMB+OIyl
	i36JekjGNPRpU/cfCuM/xUPPx+xMJdqm3V5+lB5uxkxNLwpz+sbEksBEPyzh8kBzLg0zO//wrOkLW
	OcwajDvua0mns0Ne0BksgTlcO7frmNkJgqZchvZMYiMpg8JUAL8kin9wHiEMlS8XhZPoE+jRWE5JY
	3F2gNEVVI/ufvZrfr3fZcGO1tdFrvx0JfML0cZmHitQUJJ6LoNDhZjqvaPCPmaGMqoYvT9+02PgrM
	6SVjxKaJXgqDI+Z2XTPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8gTm-00000002DDo-1mXS;
	Fri, 03 Apr 2026 15:30:38 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8gTi-00000002DCm-1dUJ;
	Fri, 03 Apr 2026 15:30:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1775230230; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=vAXnuXYy5CVxib+kdtLGkhTwGblq2YVJ173NjMXO3mM=;
	b=rPqPVFoZShPknHQRgyK2fvbT6hs/MBJeuJwC2kU+gwEsKbYBCgUermDj8cVHQ2/p/maB4mgA3aiZmBFE16I+ChUVrCoUdBVHElbgBmiw0t1f2OUy32bvtHra/hS27QGHvyjYnR+Kh4pdK+sy2eau4QGYhD2yEz0zsmeLN2jaXgg=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0X0KbxUp_1775230226;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X0KbxUp_1775230226 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 03 Apr 2026 23:30:27 +0800
From: fangyu.yu@linux.alibaba.com
To: pbonzini@redhat.com,
	corbet@lwn.net,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	skhan@linuxfoundation.org
Cc: guoren@kernel.org,
	radim.krcmar@oss.qualcomm.com,
	andrew.jones@oss.qualcomm.com,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH v8 3/3] RISC-V: KVM: Reuse KVM_CAP_VM_GPA_BITS to select HGATP.MODE
Date: Fri,  3 Apr 2026 23:30:18 +0800
Message-Id: <20260403153019.9916-4-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260403153019.9916-1-fangyu.yu@linux.alibaba.com>
References: <20260403153019.9916-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_083035_151552_1337F1F1 
X-CRM114-Status: UNSURE (   8.63  )
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

From: Fangyu Yu <fangyu.yu@linux.alibaba.com>

Reuse KVM_CAP_VM_GPA_BITS to advertise and select the effective
G-stage GPA width for a VM.

KVM_CHECK_EXTENSION(KVM_CAP_VM_GPA_BITS) returns the effective GPA
bits for a VM, KVM_ENABLE_CAP(KVM_CAP_VM_GPA_BITS) allows userspace
to downsize the effective GPA width by selecting a smaller G-stage
page table format:
  - gpa_bits <= 41 selects Sv39x4 (pgd_levels=3)
  - gpa_bits <= 50 selects Sv48x4 (pgd_levels=4)
  - gpa_bits <= 59 selects Sv57x4 (pgd_levels=5)

Reject the request with -EINVAL for unsupported values and with -EBUSY
if vCPUs have been created or any memslot is populated.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/kvm/vm.c | 44 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index fb7c4e07961f..a9f083feeb76 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -214,12 +214,52 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 
 int kvm_vm_ioctl_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap)
 {
+	if (cap->flags)
+		return -EINVAL;
+
 	switch (cap->cap) {
 	case KVM_CAP_RISCV_MP_STATE_RESET:
-		if (cap->flags)
-			return -EINVAL;
 		kvm->arch.mp_state_reset = true;
 		return 0;
+	case KVM_CAP_VM_GPA_BITS: {
+		unsigned long gpa_bits = cap->args[0];
+		unsigned long new_levels;
+		int r = 0;
+
+		/* Decide target pgd levels from requested gpa_bits */
+#ifdef CONFIG_64BIT
+		if (gpa_bits <= 41)
+			new_levels = 3;        /* Sv39x4 */
+		else if (gpa_bits <= 50)
+			new_levels = 4;        /* Sv48x4 */
+		else if (gpa_bits <= 59)
+			new_levels = 5;        /* Sv57x4 */
+		else
+			return -EINVAL;
+#else
+		/* 32-bit: only Sv32x4*/
+		if (gpa_bits <= 34)
+			new_levels = 2;
+		else
+			return -EINVAL;
+#endif
+		if (new_levels > kvm_riscv_gstage_max_pgd_levels)
+			return -EINVAL;
+
+		/* Follow KVM's lock ordering: kvm->lock -> kvm->slots_lock. */
+		mutex_lock(&kvm->lock);
+		mutex_lock(&kvm->slots_lock);
+
+		if (kvm->created_vcpus || !kvm_are_all_memslots_empty(kvm))
+			r = -EBUSY;
+		else
+			kvm->arch.pgd_levels = new_levels;
+
+		mutex_unlock(&kvm->slots_lock);
+		mutex_unlock(&kvm->lock);
+
+		return r;
+	}
 	default:
 		return -EINVAL;
 	}
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
