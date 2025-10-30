Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4517ECCF9F0
	for <kvm-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 20:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ats+aTyR0cRhDxZBc2ZlSgCEQAEjKn0/LActR+3gX4=; b=Q4+/9ioUVdFktG
	ohTu3bQMVBvs6uBJ5d9DsmuGL4ACVnZZ8BRDa/ySqnMNAFBzDqd2jF8vhIobsYICV06gN/RIxUQ0d
	PfiUUPPGD32P6H8nzNVctM983oZy9s6mCQjgdRncKi3kOLSz99DaqZW4AB4aAjGXkxXTEqumw91Ir
	gmepozukoeYi9I12i7WzorUlfQ8W8+E7uWHyvWro4KUESrDsFD9qTH6tk8RWe+Zqs0u5ZkshfLB9K
	Ztbfjf4Fgl2uITx6gnhWCelROKBhPz1uFgqaP0HANICDfLCvu7wbWEMd2sedRRk/stxsioc9mnUh1
	I3ff+l18urcM/dIih01Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZ1g-00000004nV4-1qZG;
	Thu, 30 Oct 2025 20:13:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYzI-00000004kZm-0QOF
	for kvm-riscv@bombadil.infradead.org;
	Thu, 30 Oct 2025 20:11:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gJtCncfCK9X54oXx991KGpYhmmpTyjjcLT5mmtOhZeY=; b=nwHArAFWXEfr4USVs5vttBRLMG
	olz2Fc1h2NSXXgCpPKTFjkBjDjQGExVRGWDeul6zO6yEn/Nsa/tbDFF9aPs47pQWKr3W1Z1I1s5/D
	GxX8oSLFZMI10Mu7sytOr5ZvzvHRrcdN/7kJvC1QkWbA68RUb+bAjTKGBR9W0jz/YQxFeoIJjLl2i
	79VIN0YR8+M1qjD9xZt52upQ6O+d8gZMNh0XqEkdZu6B+5VgXWEpqmB22eeUP5b8/2raG1w1LhT8A
	QzcAO02mfcQTo0S4MU7HghKUMgGfKiWYWRqcLcJF2E1t1cnhIAbjClVpJnRFgk6fss3b3MJL2q604
	iH9RP+1A==;
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYzE-0000000C65q-0KHD
	for kvm-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 20:11:11 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b6ceba8968dso1138959a12.2
        for <kvm-riscv@lists.infradead.org>; Thu, 30 Oct 2025 13:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855065; x=1762459865; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=gJtCncfCK9X54oXx991KGpYhmmpTyjjcLT5mmtOhZeY=;
        b=KVcSia2MIbjphOdVN9G57u1A7kfG1lD9E79WfByl7EsJ2oxmkoMUM7BzajShsJKQAQ
         +KcEUbFNxAFL33w0C/MtHUt1WadBBnJS3fci2+MBA2glHlwaZFsm12i/DhX5tci7zAMD
         vRlQvQmY4hXmUZjYbRKKrFEt/gTxzRBwIyCfexOWY6kZMNT62kwYbCurq038HhsW4mum
         TYe+Kacqt0nKB4ma/z3tK+ly5H7uj8W36dQdMCxuWr9MBm2vlUf8mZXpbqMCIOHe7yfG
         ej2jsBbnfqgjoeRx70rn9WBLNQQq6voLFv5zuljdPnVSXaF2GR2Ku/7vmx6+zlWD6M1M
         QE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855065; x=1762459865;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gJtCncfCK9X54oXx991KGpYhmmpTyjjcLT5mmtOhZeY=;
        b=IGwXQCBMQjeuGlCFq6SGLtETuOaylfg52SD3gWA1OsFgAaDtxlhTswZFSd+kv5V603
         fvnDi8CvmssV6E7vVqvBLucHlVSRKYrl3X+KXGOxm2+ss9LoefWQ/6RF6dUv2WDNzYuQ
         lso4O2Wf7xE62OnVaS6F4bPnqRieO1RXQa09DL6EERvs19hYzSAuIH8uTBlSHWdK3kCA
         No0JT15KM5etERkgmpjjdEdWF5UBcM3zkKSuLGdFPAFkJ6gvy0j6PdtXTZ0WoZrFGp3y
         vvQ4jgCeudHLTAfPohwEEVbMa83Cfwtmb9VYn8txTXvQDuIoMLh87620lrr1Y46Z3uHW
         6beQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0p5Jyglxp4Dj98Hf7PQQBi1+ha4kGCDa8cuTFcavH7EshgD5SGFAFl8y8ZS3TiDUJJFujxsRj5ak=@lists.infradead.org
X-Gm-Message-State: AOJu0YwYy37ArLyy5O6jPv2ZZwZ5d5hbjQklewla5Nyz6HSGP7TsSqgA
	3D4/hAUbSUpbSxs9zGMGpjNYq4Vbn6aw9CANTy/U0+rN9y6m6C54VvPd4UkLvsu/pneNqPvO1j/
	RMuPHzg==
X-Google-Smtp-Source: AGHT+IGHOQLpfyFznvDWNUH7H5RRwumwXl+ad4M1fU9LKzyWdjNf4lBkOJxqkb3vWAdXWhUIZ0D4LKjuEDo=
X-Received: from pjd14.prod.google.com ([2002:a17:90b:54ce:b0:339:ee20:f620])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3e4d:b0:32e:528c:60ee
 with SMTP id 98e67ed59e1d1-34083055b02mr1449393a91.24.1761855065570; Thu, 30
 Oct 2025 13:11:05 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:09:50 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-28-seanjc@google.com>
Subject: [PATCH v4 27/28] KVM: TDX: Bug the VM if extending the initial
 measurement fails
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_201109_351501_41226AA2 
X-CRM114-Status: GOOD (  15.33  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

WARN and terminate the VM if TDH_MR_EXTEND fails, as extending the
measurement should fail if and only if there is a KVM bug, or if the S-EPT
mapping is invalid.  Now that KVM makes all state transitions mutually
exclusive via tdx_vm_state_guard, it should be impossible for S-EPT
mappings to be removed between kvm_tdp_mmu_map_private_pfn() and
tdh_mr_extend().

Holding slots_lock prevents zaps due to memslot updates,
filemap_invalidate_lock() prevents zaps due to guest_memfd PUNCH_HOLE,
vcpu->mutex locks prevents updates from other vCPUs, kvm->lock prevents
VM-scoped ioctls from creating havoc (e.g. by creating new vCPUs), and all
usage of kvm_zap_gfn_range() is mutually exclusive with S-EPT entries that
can be used for the initial image.

For kvm_zap_gfn_range(), the call from sev.c is obviously mutually
exclusive, TDX disallows KVM_X86_QUIRK_IGNORE_GUEST_PAT so the same goes
for kvm_noncoherent_dma_assignment_start_or_stop(), and
__kvm_set_or_clear_apicv_inhibit() is blocked by virtue of holding all
VM and vCPU mutexes (and the APIC page has its own non-guest_memfd memslot
and so can't be used for the initial image, which means that too is
mutually exclusive irrespective of locking).

Opportunistically return early if the region doesn't need to be measured
in order to reduce line lengths and avoid wraps.  Similarly, immediately
and explicitly return if TDH_MR_EXTEND fails to make it clear that KVM
needs to bail entirely if extending the measurement fails.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 8bcdec049ac6..762f2896547f 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -3123,21 +3123,23 @@ static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
 
 	put_page(src_page);
 
-	if (ret)
+	if (ret || !(arg->flags & KVM_TDX_MEASURE_MEMORY_REGION))
 		return ret;
 
-	if (arg->flags & KVM_TDX_MEASURE_MEMORY_REGION) {
-		for (i = 0; i < PAGE_SIZE; i += TDX_EXTENDMR_CHUNKSIZE) {
-			err = tdh_mr_extend(&kvm_tdx->td, gpa + i, &entry,
-					    &level_state);
-			if (err) {
-				ret = -EIO;
-				break;
-			}
-		}
+	/*
+	 * Note, MR.EXTEND can fail if the S-EPT mapping is somehow removed
+	 * between mapping the pfn and now, but slots_lock prevents memslot
+	 * updates, filemap_invalidate_lock() prevents guest_memfd updates,
+	 * mmu_notifier events can't reach S-EPT entries, and KVM's internal
+	 * zapping flows are mutually exclusive with S-EPT mappings.
+	 */
+	for (i = 0; i < PAGE_SIZE; i += TDX_EXTENDMR_CHUNKSIZE) {
+		err = tdh_mr_extend(&kvm_tdx->td, gpa + i, &entry, &level_state);
+		if (TDX_BUG_ON_2(err, TDH_MR_EXTEND, entry, level_state, kvm))
+			return -EIO;
 	}
 
-	return ret;
+	return 0;
 }
 
 static int tdx_vcpu_init_mem_region(struct kvm_vcpu *vcpu, struct kvm_tdx_cmd *cmd)
-- 
2.51.1.930.gacf6e81ea2-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
