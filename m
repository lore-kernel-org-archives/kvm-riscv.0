Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACC1C982F8
	for <kvm-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 17:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:Mime-Version:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+7GPY3dXjA6tKyMDppVUEY2XLyJeU6/Hq+1XjdgnGmo=; b=WW0RuyntoBcVCa
	9uAN+dymZoTPKhQFSw2atssDUaRtFs14TM1tuKV3yJVfqCF6KjHo8fV3GuREiVp5y0kVBXkLS1Mmh
	cbrAjPploUzSk997/uezDIt2jAG4z+mNwteSpkzfRf56cXqjzidsdDHSfaTGinb4q9MoclgMabvFB
	Z3bm6QsWRQVEEDOpLJuFoMtYT3QRSIbung5dElUhUDPErczL8gWbvyKQPLGoOtOTS4cO8G+RdPbEZ
	/eHRpit/1HPaFP+jkEIieKewc1y032oTQTegkcLSPOJYUX2fqfp7LosnTi+z623W3QGzQKzLj455Z
	QW4eEtbrqediJEgz25xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8i4V-000000031cf-1QwQ;
	Mon, 21 Sep 2026 17:44:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8i4T-000000031bu-3BnT
	for kvm-riscv@bombadil.infradead.org;
	Mon, 21 Sep 2026 17:44:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:Mime-Version:Date:Reply-To:Sender:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=vpZEGIou0oqWtJedTRzj6hNhUCCuK0pge9AESQcyXk4=; b=MUwHsZ1mN0ESoewppLRSqhPGAw
	y0PwSiPy95jDvD8rnawlXUcMmJNMqbsKg3OvS2hb1jvZvIQn9sRIHZvOgia3z3ZorIxOSTIy35tHg
	sdY/+0xRHRiJEzVQfxOg8024dAazOJ1ezHUjym6hr91Yc9j2Q4UD6F393soLZYHPuezZctZ9nNKMK
	8duHiZMnhRlkPrhnJg4lNOF5SsqKsqsggZQWOyubtdnnSi/4Cqewp7dVv96pcKh0kZolDmwraksoq
	VE6gtHouCX/CUqAQSksqUTtngOzSxzhreSH9mhGqHKc90mqWiBwmZ39sjpWdQ1R36Byeq0JuwiHIi
	CDjaYt/g==;
Received: from mail-pf1-x445.google.com ([2607:f8b0:4864:20::445])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8i4Q-0000000Cdnk-0F2G
	for kvm-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 17:44:52 +0000
Received: by mail-pf1-x445.google.com with SMTP id d2e1a72fcca58-854f274dd69so3343475b3a.1
        for <kvm-riscv@lists.infradead.org>; Mon, 21 Sep 2026 10:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790012687; x=1790617487; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vpZEGIou0oqWtJedTRzj6hNhUCCuK0pge9AESQcyXk4=;
        b=OEIqo3y14pJIgkQ9SCvWepD9vn7B82mQIj8rG8A8Oqr2jxgQcljKZCBBaKlTCi0saf
         b0R/eK7Djz7aE5qHaBzXBNgidfwzk4BVbadJ/G4FyutHfRGakLYWx7d7prbl69k/jrLd
         aiyGVjbFohvZ2TKM9y+UcHRDwt2/7YYbGNXhC2YjhRJxgPsEbV5xkyR5NAbfbjuACYhc
         gs9eum3UtRewQvrAmuX5whM5U+qc8Cece1yVFLvBoSLV7+VvVOxedIWejZpxVvs7yWAr
         6KrHAjVbjdp8A1c5VpXC/W1FsLHLFTVHVCOFCer1tAWUiQQS17f17uHKyRdcawS93fXh
         F+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790012687; x=1790617487;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vpZEGIou0oqWtJedTRzj6hNhUCCuK0pge9AESQcyXk4=;
        b=a0KzvlAA0NiJRCVDg0w99sbDqfLQesSTytOIy9xRW3dZtcFEuvZkR/185BzJfZ+aP+
         rLQbSeV6uJiY8G1OsHXI1SRBrgqB1hLydbY9PCgJVEM40etcY5B8b8LVa4TR7v6YQqhc
         IfXT/2re8EuHM5l2Ydut8Hi5l28MokjPvDgxMlw27IJpah6NoBE/MzC/favxL46iRguN
         ABnXJL1frIiO2c8F0w22zebJX/WtT+/dofCQQuEeWL4nwTyKhAFqK/a/2iQcAd9/ekfa
         6EFT2pDdluLbuyAjDM+AfbIGk9QyJxvXzujfaEo2qIIoiSQgfLvwu+NlAMF80VLYTrCL
         haXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRRPGxilxO6QF3azpfJaqi9HZx/EVDDcfkmKKyF0vFZWcRAAblPhkYMDImPQ4B0c6r1vRvaBBqGWY=@lists.infradead.org
X-Gm-Message-State: AFuF++lZJkUrxprYhLpZc1XTl8kwlr+0vH9bBd2dtaYMiAEaSadTMWjX
	e+InbhUoXVRFbJmNxuAQbktIfz6CXfkOZocNCEc7BA9sYKTqOVxR41J4gKhY0Ce5QbpD4WWbPJl
	PFB1KPw==
X-Received: from pfbgs18.prod.google.com ([2002:a05:6a00:4d92:b0:87a:49f8:6a76])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:9487:b0:878:3507:8d6b
 with SMTP id d2e1a72fcca58-8783508a7bemr7870003b3a.50.1790012686945; Mon, 21
 Sep 2026 10:44:46 -0700 (PDT)
Date: Mon, 21 Sep 2026 10:44:38 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921174445.911676-1-seanjc@google.com>
Subject: [PATCH v2 0/7] KVM: Serialize vCPU creation and revert vcpu_ids tracking
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
X-CRM114-CacheID: sfid-20260921_184450_287375_3DEE329E 
X-CRM114-Status: UNSURE (   9.33  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Serialize vCPU creation by holding kvm->lock for the entirety of
kvm_vm_ioctl_create_vcpu(), and then revert the now-redundant tracking adding
by commit 97d65b544f48 ("KVM: Check for duplicate vcpu_id as early as
possible").  I botched the math when justifying the vcpu_ids tracking; it's not
an extra 256 bytes, it's an extra 2048 bytes.  Roughly doubling the size of
"struct kvm" tripped x86's KVM_SANITY_CHECK_VM_STRUCT_SIZE, and obviously isn't
something we want to do in general.

The TL;DR of why it's a-ok to serialize vCPU creation is that no VMM actually
does parallel vCPU creation.  As with so many things, KVM's current behavior is
the result of decades-old cruft, not intentional, deliberate design.

Patches 1-3 are a tangentially related cleanups and bug fixes; I included them
here because holding kvm->lock for all of vCPU creation allows WARNing if KVM
attempts to lock all vCPUs if vCPU creation is in-progress (the caller must
hold kvm->lock).

v2:
 - Tweak patch 1's changelog to clarify that that only x86's manual checks are
   dropped. [Sashiko]
 - Add patches to convert additional arm64 and RISC-V usage to 
   kvm_is_vcpu_creation_in_progress(). [Sashiko]
 - Remove acquisition of kvm->lock from s390 and PPC vCPU creation flows.
   [Christian, Sashiko]
 - Add Jean-Christophe's Tested-by to the revert.

v1: https://lore.kernel.org/all/20260914181223.289061-1-seanjc@google.com

Sean Christopherson (7):
  KVM: Reject attempts to lock all vCPUs if vCPU creation is in-progress
  KVM: arm64: vgic: Rely on vCPU creation check in "trylock all vCPUs"
  KVM: RISC-V: Use kvm_is_vcpu_creation_in_progress() instead of
    open-coded equivalent
  KVM: Protect all of kvm_vm_ioctl_create_vcpu() with kvm->lock
  KVM: Move check for existing vCPU ID to the top of vCPU creation
  Revert "KVM: Check for duplicate vcpu_id as early as possible"
  KVM: WARN if vCPU creation is in-progress when locking all vCPUs

 arch/arm64/kvm/vgic/vgic-init.c | 12 ++++-------
 arch/powerpc/kvm/book3s_hv.c    |  2 --
 arch/riscv/kvm/aia_device.c     |  2 +-
 arch/s390/kvm/s390/s390.c       |  5 +----
 arch/x86/kvm/svm/sev.c          | 10 ----------
 arch/x86/kvm/vmx/tdx.c          |  5 -----
 include/linux/kvm_host.h        |  1 -
 virt/kvm/kvm_main.c             | 35 +++++++++++----------------------
 8 files changed, 17 insertions(+), 55 deletions(-)


base-commit: d599822bdb66aeec5ec76297b0fc6efaaeefe07c
-- 
2.55.0.1082.g2b9226bbc0-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
