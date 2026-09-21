Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EB0C982FC
	for <kvm-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 17:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sLmLKYRWPFwquJRl2BgQTj3qU7byuoduLB7L/TZfKk8=; b=Ov7M1ycbb2RfMY
	NVvjNAXStrHzl9fvRutc5Fxbh5aFS9wai4D0x8g1BnNYFuNWUS4kRUrYdWtSyYjo48a3eBRObUY5K
	CRELcoKQqENxXtmURKj1G/dkfaeUWbRehrcIWgqT8ZpcHlV4ubhNEioyVF97pdJoHVGGUbvess2bi
	juXQlrmbL2NDXLXtlcBi4x0QsS79tb1ddT8acULk43InkmkXqopL8VK9aBttfYvo9cF8QCpwlQdbB
	R/lo4wom7CQGPEjiDA2dHr3GAh04revKTY0dxKzAXcVuLkm0S0PKd9bB353uk/o+lIRr0rwKmx3bS
	n6McIoPM2BkoianRDAjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8i4a-000000031gc-0mLN;
	Mon, 21 Sep 2026 17:45:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8i4Y-000000031e7-0hMD
	for kvm-riscv@bombadil.infradead.org;
	Mon, 21 Sep 2026 17:44:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qeiicXWgTPk3n7JADXXm7zikz8BknOrQz3jHJRoDF6U=; b=h+2PdUvZTQxSVV9yeVvOMaPDvb
	46jZVD9FmKm4xmvJ7V6rhx7u9bmlLkjHfiUCM/kdLZHXKL9z8IzHyq+vws5k/lh9KIf+l+bTQVE9n
	YtToNHIF7xT7Lp71ioXapMrKjLYELeYPTsxFaVEda0ppaFBO46bt6s0nQdwB3gk377XokPsrHlaWz
	rQVKt2aevOhMee1a3vcP2Y9fpSyVH2yFnsSUyN1lmyRvF0wnrz3KSHHzwUClP8KRAxcJ2Y/6HYHmp
	JRttPqhQW9pPv0Zty9okk3A5RO1eUi4J5cY+LF91k/dyt/1soUe8SuQQq+3ZrZCvUX8T0/3ZvZVLU
	PMd69SFA==;
Received: from mail-pf1-x447.google.com ([2607:f8b0:4864:20::447])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8i4U-0000000Cdps-1NlW
	for kvm-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 17:44:56 +0000
Received: by mail-pf1-x447.google.com with SMTP id d2e1a72fcca58-855315ccb64so3193421b3a.3
        for <kvm-riscv@lists.infradead.org>; Mon, 21 Sep 2026 10:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790012692; x=1790617492; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qeiicXWgTPk3n7JADXXm7zikz8BknOrQz3jHJRoDF6U=;
        b=v2teOY9Ny9ESV88smd/ECUlWSQcazobThCD7U9JVgCMMDldH+Rvt2vL49rvaO6JJVI
         QF6lmriS2VkdmdJN1egxrc4228/maupDZPnNL0O+Yz8Y/5KoDWFuDKKK9WuiECWobp7q
         O4LpSwNDDzegA4WwDVWn8Fgp4a+y/yfZ2nM1Pos6FoZVKs3E09vi2ulyAq9T/d01BoWF
         eyTQn1WwameV0BIXEB7us/0RRxb9f+/QoOiq5MF69bjYypAQ7cLl9xqyAR7mJsnX4OOt
         Ut8X004urrCXIjoddzyG+ZaNlSb84QyN15ZazWv2GLQsn5SFIW0jjGyacHJIoCpKZwbw
         cXlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790012692; x=1790617492;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qeiicXWgTPk3n7JADXXm7zikz8BknOrQz3jHJRoDF6U=;
        b=BxB2qDJDfT/c0J9BXezijF3aoQPTuFFHflUgqBatobJazAxwsa8pnMO5p0yu3peG9/
         QhVkeiqyI1vhfp5qd7Hz1PpV3vLNtRBDX/J6Zbi9vXw4xBKUIisIfYfELW5ERgULTZNc
         8srjephsv4Pmlt6SkLQO10SDZKvS1SfW1y6tEI/WhRgufteWZE5fLFnm350Cfmi03OVH
         CRoVM4G9H5L6MsifMvdWe5F7NEeCpoZrxG00txKDsrFP8vVeg0g9TxHCi0swtZFZVonn
         7xb+WAfd98nuKxJOCaC0DY4eiGsmRG5m/J4IFTXvtN7hvBrNf2qcOphXvzm4vUKJDP3k
         5VaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhy2rbHsBWPMNb1Q85u+e70qPUxc6FA8dJWTcfPR98jp/CDj1r6YwdNtUQz/Hox7I8jqKkIJTWggo=@lists.infradead.org
X-Gm-Message-State: AFuF++mj8guZToAFv1FypNl6+GVplAWUwM4lkoCrOSmVMc7gbIX1sjL+
	5duwwzG0BCNf1iTBypyvxLsz/4zk1C8ioxlI+uN3SGOj9tHUJ6HfEXCyKK4HyzDqiaE6Xjyu+V3
	oTapezQ==
X-Received: from pfw3.prod.google.com ([2002:a05:6a00:a263:b0:879:1348:bebf])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1f06:b0:857:727c:a1f1
 with SMTP id d2e1a72fcca58-874dddfa3acmr14506041b3a.19.1790012691865; Mon, 21
 Sep 2026 10:44:51 -0700 (PDT)
Date: Mon, 21 Sep 2026 10:44:42 -0700
In-Reply-To: <20260921174445.911676-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260921174445.911676-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921174445.911676-5-seanjc@google.com>
Subject: [PATCH v2 4/7] KVM: Protect all of kvm_vm_ioctl_create_vcpu() with kvm->lock
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, Atish Patra <atish.patra@linux.dev>, 
	Alexandre Ghiti <alex@ghiti.fr>, Dave Hansen <dave.hansen@linux.intel.com>, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jean-Christophe Guillain <jean-christophe@guillain.net>, 
	"=?UTF-8?q?Pawe=C5=82=20S?=" <spawel523@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_184454_738768_2E8EF6CA 
X-CRM114-Status: GOOD (  16.07  )
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

When creating a vCPU, don't drop kvm->lock to when doing the bulk of actual
vCPU creation, as allowing multiple vCPUs to be created in parallel adds
significant complexity in KVM (as evidenced by the many related bugs), and
all known VMMs fully serialize vCPU creation.  Remove all manually locking
of kvm->lock from kvm_arch_vcpu_{post,}create() for obvious reasons.

For many years, "everyone" has assumed that dropping kvm->lock was done for
performance reasons optimization, e.g. to allow userspace to create all
vCPUs concurrently for latency purposes.  But as above, no known VMM does
that.  Looking at the history of this code, before commit 11ec28047118
("KVM: Convert vm lock to a mutex"), kvm->lock was a spinlock.  I.e. KVM
*had* to drop kvm->lock when doing the bulk of vCPU creation, otherwise KVM
couldn't do normal memory allocations.  When kvm->lock got turned into a
mutex for unrelated reasons, no one took advantage updated of the change to
simplify vCPU creation.  And 19 years later, everyone just assumed that KVM
continued to deal with the complexity for performance reasons.

Furthermore, naively parallelizing vCPU creation in userspace is likely a
net negative due to the overheads of task creation.  Unless a VMM carefully
avoids the extra overhead related to parallelization, e.g. spawns each
vCPU's thread before creating the vCPU, creating vCPUs concurrently is a
net *negative* up until about ~64 vCPUs, after which the times are a wash.

The absolute speed of light _is_ faster if KVM doesn't hold kvm-lock, but
at vCPU counts of ~16 or less, it's probably in the noise when considering
total VM creation time, as the added latency is less than 1ms up until 16
or so vCPUs.

On top of all that, KVM has had a *lot* of fatal bugs (most often found by
syzkaller) related to vCPUs being created while trying to do per-VM
operations (basically, see every flow that locks all vCPUs).  I.e. the
parallel vCPU creation "support" is actively harmful as the only "use case"
is for misbehaving userspace to exploit KVM bugs.

Serializing vCPU creation will allow reverting commit 97d65b544f48 ("KVM:
Check for duplicate vcpu_id as early as possible"), which had "minor" math
error: the worst case scenario isn't "256 bytes per VM", it's "256 unsigned
longs per VM", i.e. 2048 bytes per VM, which doubles the size of each VM
and pushes several architectures into order-1 allocations.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/book3s_hv.c |  2 --
 arch/s390/kvm/s390/s390.c    |  5 +----
 virt/kvm/kvm_main.c          | 22 +++++-----------------
 3 files changed, 6 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 0409ac9e7b31..30f7095a156e 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3058,7 +3058,6 @@ static int kvmppc_core_vcpu_create_hv(struct kvm_vcpu *vcpu)
 
 	init_waitqueue_head(&vcpu->arch.cpu_run);
 
-	mutex_lock(&kvm->lock);
 	vcore = NULL;
 	err = -EINVAL;
 	if (cpu_has_feature(CPU_FTR_ARCH_300)) {
@@ -3091,7 +3090,6 @@ static int kvmppc_core_vcpu_create_hv(struct kvm_vcpu *vcpu)
 			mutex_unlock(&kvm->arch.mmu_setup_lock);
 		}
 	}
-	mutex_unlock(&kvm->lock);
 
 	if (!vcore)
 		return err;
diff --git a/arch/s390/kvm/s390/s390.c b/arch/s390/kvm/s390/s390.c
index eca4a4359ab2..cc628afbb850 100644
--- a/arch/s390/kvm/s390/s390.c
+++ b/arch/s390/kvm/s390/s390.c
@@ -3579,12 +3579,11 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 
 void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
 {
-	mutex_lock(&vcpu->kvm->lock);
 	preempt_disable();
 	vcpu->arch.sie_block->epoch = vcpu->kvm->arch.epoch;
 	vcpu->arch.sie_block->epdx = vcpu->kvm->arch.epdx;
 	preempt_enable();
-	mutex_unlock(&vcpu->kvm->lock);
+
 	if (!kvm_is_ucontrol(vcpu->kvm)) {
 		vcpu->arch.gmap = vcpu->kvm->arch.gmap;
 		sca_add_vcpu(vcpu);
@@ -3757,13 +3756,11 @@ static int kvm_s390_vcpu_setup(struct kvm_vcpu *vcpu)
 
 	kvm_s390_vcpu_pci_setup(vcpu);
 
-	mutex_lock(&vcpu->kvm->lock);
 	if (kvm_s390_pv_is_protected(vcpu->kvm)) {
 		rc = kvm_s390_pv_create_cpu(vcpu, &uvrc, &uvrrc);
 		if (rc)
 			kvm_s390_vcpu_unsetup_cmma(vcpu);
 	}
-	mutex_unlock(&vcpu->kvm->lock);
 
 	return rc;
 }
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 78cc090435be..c17cc8dd371b 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4165,6 +4165,8 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 	struct kvm_vcpu *vcpu;
 	struct page *page;
 
+	guard(mutex)(&kvm->lock);
+
 	/*
 	 * KVM tracks vCPU IDs as 'int', be kind to userspace and reject
 	 * too-large values instead of silently truncating.
@@ -4177,26 +4179,18 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 	if (id >= KVM_MAX_VCPU_IDS)
 		return -EINVAL;
 
-	mutex_lock(&kvm->lock);
-	if (kvm->created_vcpus >= kvm->max_vcpus) {
-		mutex_unlock(&kvm->lock);
+	if (kvm->created_vcpus >= kvm->max_vcpus)
 		return -EINVAL;
-	}
 
-	if (test_bit(id, kvm->vcpu_ids)) {
-		mutex_unlock(&kvm->lock);
+	if (test_bit(id, kvm->vcpu_ids))
 		return -EEXIST;
-	}
 
 	r = kvm_arch_vcpu_precreate(kvm, id);
-	if (r) {
-		mutex_unlock(&kvm->lock);
+	if (r)
 		return r;
-	}
 
 	kvm->created_vcpus++;
 	__set_bit(id, kvm->vcpu_ids);
-	mutex_unlock(&kvm->lock);
 
 	vcpu = kmem_cache_zalloc(kvm_vcpu_cache, GFP_KERNEL_ACCOUNT);
 	if (!vcpu) {
@@ -4227,8 +4221,6 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 			goto arch_vcpu_destroy;
 	}
 
-	mutex_lock(&kvm->lock);
-
 	if (WARN_ON_ONCE(kvm_get_vcpu_by_id(kvm, id))) {
 		r = -EEXIST;
 		goto unlock_vcpu_destroy;
@@ -4267,7 +4259,6 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 	atomic_inc(&kvm->online_vcpus);
 	mutex_unlock(&vcpu->mutex);
 
-	mutex_unlock(&kvm->lock);
 	kvm_arch_vcpu_postcreate(vcpu);
 	kvm_create_vcpu_debugfs(vcpu);
 	return r;
@@ -4278,7 +4269,6 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 	xa_erase(&kvm->vcpu_array, vcpu->vcpu_idx);
 unlock_vcpu_destroy:
 	vcpu->vcpu_idx = -1;
-	mutex_unlock(&kvm->lock);
 	kvm_dirty_ring_free(&vcpu->dirty_ring);
 arch_vcpu_destroy:
 	kvm_arch_vcpu_destroy(vcpu);
@@ -4287,10 +4277,8 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 vcpu_free:
 	kmem_cache_free(kvm_vcpu_cache, vcpu);
 vcpu_decrement:
-	mutex_lock(&kvm->lock);
 	kvm->created_vcpus--;
 	__clear_bit(id, kvm->vcpu_ids);
-	mutex_unlock(&kvm->lock);
 	return r;
 }
 
-- 
2.55.0.1082.g2b9226bbc0-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
