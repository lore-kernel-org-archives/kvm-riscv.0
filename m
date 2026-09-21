Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC87AC982FA
	for <kvm-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 17:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DiiLENk1yeQ14JO+nV+BFOOrdzHN7upjTBtWjV4s9tk=; b=4qu4X2OtQrG/VR
	n9WyvfeUyNOG/MAkKsHkVk8GQ7vFKz22AsYvFi5HBMVaDFYoWNrT9y2ZR90CJ84uNZCWo4AMZB/ek
	Jq2LA0W7J3mhdx3b1Kh0RCDfxynT1oO4pF0cBLEfu54CTJD6x0fszeNqrKzA2vclJxFUtw10OkuMk
	n/wTevnWmvtIEdaGGCrO1ZjdJD6ZV4TPkmvYwMHeNX9Ls6ztu7FT7ZUDAkXy8KQ0wh8NGmbg4C7qt
	q/M7HWsXUQlRHSGb7I+iqi5X2lToqeadOeVHP6llSAHiiS86KJ4qLavOCg/rBg6EBC6hH/A0/PF14
	DHJRQc11KK8Myrjj2Mww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8i4W-000000031dI-1bf7;
	Mon, 21 Sep 2026 17:44:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8i4U-000000031cA-2zXI
	for kvm-riscv@bombadil.infradead.org;
	Mon, 21 Sep 2026 17:44:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZLfRYJewP8aR3Y4V2zbyCdDW63inecBdjfc5u4aaKpU=; b=Cvzu4FfkgFJzd9Cb90FthEVOte
	bV+3SNq5dyeXxH+PkI2RUX68Hz3gRKNkiYy6xyLFx12oBxPEDDzpCqe6p9/ZR0KZlS17Yn9NOB59S
	yrtum+C47n3coeGh9pQ7n47Wz67m1N5pm1t5xXQUzn+m7Nx/PcYGV43ldExs4mUPdss6Fv0dNe6bV
	38DkJInj1z5Q9cxz9rLB6jcUaqptqmr/lpjoI0JhaAVR6HnWN8uwQ3Jt958vzu7nU7+fShYtqEkKD
	2vB6bZg/EkHWqsf5iIcE79OaVJwS+dUqbVP9ir2nzRKgyzG2s9sMgDL38Cv7IucFEaCF/NJRIkrfJ
	XCkfEtfw==;
Received: from mail-pf1-x448.google.com ([2607:f8b0:4864:20::448])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8i4R-0000000Cdnz-12xh
	for kvm-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 17:44:53 +0000
Received: by mail-pf1-x448.google.com with SMTP id d2e1a72fcca58-8679cfe5019so4671940b3a.0
        for <kvm-riscv@lists.infradead.org>; Mon, 21 Sep 2026 10:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790012689; x=1790617489; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZLfRYJewP8aR3Y4V2zbyCdDW63inecBdjfc5u4aaKpU=;
        b=IwGBPBF9moi95LMGwaM061UNG9o86+ev+iykamSarUeWbWKTXbljLgzdZDy53+W2M4
         a/g6tdwXObNVtA8qZSmOtA2ziI7GedOg/uGUOAAgX8KoTsyDxKSAnBd5Ow6zOf3x5ngg
         aq8vuuGKCv8Pci3DY926rdvhc9TPAkmnsA3xPIfr0r+yb94LApXJwVXX4jaPgMrmPYj/
         +qfWfsgTMzPhFGgK+PjeMoDc1Bx1UnGWQBCFMeSCjaWigBrFYnJzq3PxfdUEgAVOyNUL
         7qEMEMJ/Ew3lDy0czY5oPOF/lTHpBqP/nmYYAsTQMkQYRbTVYK0rhWqxwS8v58T5fgHq
         G14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790012689; x=1790617489;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZLfRYJewP8aR3Y4V2zbyCdDW63inecBdjfc5u4aaKpU=;
        b=TfjDs3D6EgbHWdlR3StsJgpcyrf7jT+hXuHg5uWaEU54MIHnr09d/RZ2DJ47vdB71M
         xQ9lwefV1Dn527EZXvUTgZ+eQNpYXm7JsSwJ+BCto/9e6IizhYcqDkpcrr48vryqrdtM
         Nqou2Vmvf5lL/KpDTTeuI61d6SBXCo/uDTnEXrc6OnEp1BZjbZPJ1T0I641avmFGZQbX
         fHFBPFbOXV/JSE0x1sCYtXKrgUYPU7OnoXhV3Bg8uixk1OipDj8ShyhxB4WcFAuplTl4
         1rswHsiXMc0pE/iRmBfRsb/+OlQGvoNDSP3sysWm/IESw9PDFMiwPNQZQo6juzQqaLYt
         3FLQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4W0iqplde6yfnmE2jAoSr+dyNscYly+QyMVD1lRDF2mPQCxRh5fImNl0Il1IooMi0nXfbRW8RQeI=@lists.infradead.org
X-Gm-Message-State: AFuF++l+VV/DQievKDXNjylwQxU58iisVg8+z+igfInB1bMUDTT/oHN6
	8b84h7Ljc550JYwZ90p9EJkH69+ccJuuqa3if4GiEDyZIJmrSWBWlWCpP9fjq/vs6MlRgHxbshq
	pXX5eoA==
X-Received: from pfbgk3.prod.google.com ([2002:a05:6a00:8483:b0:873:d536:aebe])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:12dd:b0:86b:73b4:30fa
 with SMTP id d2e1a72fcca58-874dc0ff42cmr17041050b3a.11.1790012688332; Mon, 21
 Sep 2026 10:44:48 -0700 (PDT)
Date: Mon, 21 Sep 2026 10:44:39 -0700
In-Reply-To: <20260921174445.911676-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260921174445.911676-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921174445.911676-2-seanjc@google.com>
Subject: [PATCH v2 1/7] KVM: Reject attempts to lock all vCPUs if vCPU
 creation is in-progress
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
X-CRM114-CacheID: sfid-20260921_184451_486773_ED4BCB77 
X-CRM114-Status: GOOD (  12.45  )
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

Reject locking of all vCPUs if vCPU creation is in-progress, i.e. if the
number of "created" vCPUs doesn't match the number of "onlined" vCPUs.
It's simply not possible to guarantee that KVM has truly locked all vCPUs
if one or more vCPUs are actively being created.  Holding kvm->lock does
prevent in-flight vCPUs from being fully onlined, but it's infeasible for
common KVM to know whether or not that provides sufficient protection.

In practice, this is likely a minor bug fix for the ARM and RISC-V usage of
kvm_trylock_all_vcpus(), and a glorified nop for everything else.  E.g.
ARM's kvm_timer_vcpu_init() can race kvm_vm_ioctl_set_counter_offset() with
respect to observing KVM_ARCH_FLAG_VM_COUNTER_OFFSET.

Opportunistically drop x86's existing manual checks on vCPU creation being
in-progress as all of x86's checks immediately precede or follow locking of
all vCPUs.  Leave arm64 and RISC-V alone for the moment, as their checks
aren't as obviously redundant/equivalent.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/sev.c | 10 ----------
 arch/x86/kvm/vmx/tdx.c |  5 -----
 virt/kvm/kvm_main.c    |  6 ++++++
 3 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 5705723f1f41..068f8a236a35 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -1125,9 +1125,6 @@ static int sev_launch_update_vmsa(struct kvm *kvm, struct kvm_sev_cmd *argp)
 	if (!sev_es_guest(kvm))
 		return -ENOTTY;
 
-	if (kvm_is_vcpu_creation_in_progress(kvm))
-		return -EBUSY;
-
 	ret = kvm_lock_all_vcpus(kvm);
 	if (ret)
 		return ret;
@@ -2115,10 +2112,6 @@ static int sev_check_source_vcpus(struct kvm *dst, struct kvm *src)
 	struct kvm_vcpu *src_vcpu;
 	unsigned long i;
 
-	if (kvm_is_vcpu_creation_in_progress(src) ||
-	    kvm_is_vcpu_creation_in_progress(dst))
-		return -EBUSY;
-
 	if (!sev_es_guest(src))
 		return 0;
 
@@ -2510,9 +2503,6 @@ static int snp_launch_update_vmsa(struct kvm *kvm, struct kvm_sev_cmd *argp)
 	unsigned long i;
 	int ret;
 
-	if (kvm_is_vcpu_creation_in_progress(kvm))
-		return -EBUSY;
-
 	ret = kvm_lock_all_vcpus(kvm);
 	if (ret)
 		return ret;
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index b272c20586a7..58c255256e4c 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2728,11 +2728,6 @@ static tdx_vm_state_guard_t tdx_acquire_vm_state_locks(struct kvm *kvm)
 
 	mutex_lock(&kvm->lock);
 
-	if (kvm->created_vcpus != atomic_read(&kvm->online_vcpus)) {
-		r = -EBUSY;
-		goto out_err;
-	}
-
 	r = kvm_lock_all_vcpus(kvm);
 	if (r)
 		goto out_err;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 65eb26a0520d..78cc090435be 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1363,6 +1363,9 @@ int kvm_trylock_all_vcpus(struct kvm *kvm)
 
 	lockdep_assert_held(&kvm->lock);
 
+	if (kvm_is_vcpu_creation_in_progress(kvm))
+		return -EBUSY;
+
 	kvm_for_each_vcpu(i, vcpu, kvm)
 		if (!mutex_trylock_nest_lock(&vcpu->mutex, &kvm->lock))
 			goto out_unlock;
@@ -1386,6 +1389,9 @@ int kvm_lock_all_vcpus(struct kvm *kvm)
 
 	lockdep_assert_held(&kvm->lock);
 
+	if (kvm_is_vcpu_creation_in_progress(kvm))
+		return -EBUSY;
+
 	kvm_for_each_vcpu(i, vcpu, kvm) {
 		r = mutex_lock_killable_nest_lock(&vcpu->mutex, &kvm->lock);
 		if (r)
-- 
2.55.0.1082.g2b9226bbc0-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
