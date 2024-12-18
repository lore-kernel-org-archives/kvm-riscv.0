Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0D0E77188
	for <kvm-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 22:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LcfMkkTA+hM51fQVzpGFr/u54V5UPJN0n2cmNmmBL9M=; b=yMHFYzRBijrGQRX4k0R10dW6v7
	DdIqOCEO2ulYPOVmCn3gvoKOCiHLWfK0+cxZtHC5BaUOenxkraRynAAM55DbOuxcGxe7IeMtbvZut
	ef1gaH/+Oa53hdofK0xRO0WgBXAyU+/gNV6QJO32gkx+tqK8vlaEDFiTIk9HqH3mlMt4//NGa98Dc
	GbjIJzMvCZ1jUShlneCdNl3gLZMEcy/g//o8cWAm68bnc4tTaf3/ejo02CLg9Rl0+w+XOXQR/QfFj
	pLaAd+FuW/zHNr/fBZ9RTJkdVHQ6rlBwZVv1lf0B7PzwmOdmUCtCos9fQAo42siGJ0pI87ULw72ZV
	Z0vWpUpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO2HH-00000000DF2-1aDb;
	Wed, 18 Dec 2024 22:12:23 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO2HE-00000000DDr-2gtJ
	for kvm-riscv@lists.infradead.org;
	Wed, 18 Dec 2024 22:12:21 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ef91d5c863so124842a91.2
        for <kvm-riscv@lists.infradead.org>; Wed, 18 Dec 2024 14:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734559939; x=1735164739; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=H8/Bx7vVXdjG8Qup6CRv0EW1z1SiIeJxiXGSb6iiEaI=;
        b=iwY+CZTJvvJH6BzMUuH2VoiwmoSyMnTUAhM+aVKPXeGY6VWnj+8T+1fKgcycslebd8
         R9QNMdHzekVFmIKITzIHSaYL1aFHIpm4/qQ2atYiosrFKxs1W0rFUhR3/EaTwhtQJYYN
         Ll1vwCipZZ3Rt24GmqrLH/E9H++DBdMjVgP5KjmPLatQfihCwzD1fqD5NR+MSZf4JZrg
         bxuJ3ACTtLLAOgdr4k1to/VIh+qfRqo9HObKX13zNZ4SnPHn0lnYL0rpaHRTblSW60Yz
         j49vyoLvC5I3aWZt02M87H/RLfBF8Kip3ebsh1/Yk82g657SwGpuIoIl2x4m2AB89csU
         ZEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734559939; x=1735164739;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H8/Bx7vVXdjG8Qup6CRv0EW1z1SiIeJxiXGSb6iiEaI=;
        b=oyvCiPofxHNbqWTyoDKixEd88YmDax541ejvInxTz5GY3BB8JoUlqkZxEn9X5oITqZ
         0tyRzsOeIGPFmZgEBTFMRT3H6k/12U/vQOpE8uSeXOzDFj0cZXbFReBs641hY7TyFOQh
         i0W1xxKzZhvqY0ftNMm0HReU5ad6rsLe2EhkM2+I8PKpMX7Mjkf9R7GuVc3AiHz4jYwt
         OzQGtryZ1dyTsl1jo6Q/WPpdGxLAyNqsJ01dxP/DgtU0kdMWub6zQAcGHU9b85gwkDfL
         NA88GPMStXRXcwTK0Y0H06sm6SXzk33xzBRWiWv9DMQYngOw2HO5VKkbOeWhZX0M4FZ3
         LcjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHCI0LwBrN+RdhqikbWcIrM0j5k8oRSP7Pb8D5e8GGDk/2vpSFjLkWc7h3pGVbShh0Gc+tKHB47aY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwYTFGXLxuX4nT5O41MxriO/OMaEJMamEo4Py7EcCpBo4wD08Jr
	OtMrgmVY7BqWGOIY9eVpVrBA66jwMUnf1I2okhgVo9Q9Xyk5R4g0UQPmQ1vJheghv7qfc55AWMp
	XdA==
X-Google-Smtp-Source: AGHT+IErnWAR5psGjYVEFgNdPO9Ra9c1ykxsWobkdL6749/rPBHLJQjHXddkE3dKVeRJv5MVr7RsZhgUpzE=
X-Received: from pjuj8.prod.google.com ([2002:a17:90a:d008:b0:2ea:7d73:294e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:134d:b0:2ea:37b4:5373
 with SMTP id 98e67ed59e1d1-2f443ce8daamr1395725a91.10.1734559939355; Wed, 18
 Dec 2024 14:12:19 -0800 (PST)
Date: Wed, 18 Dec 2024 14:12:18 -0800
In-Reply-To: <173455833964.3185228.5614329030867008316.b4-ty@google.com>
Mime-Version: 1.0
References: <20241128005547.4077116-1-seanjc@google.com> <173455833964.3185228.5614329030867008316.b4-ty@google.com>
Message-ID: <Z2NIwmRDaZBc_V4o@google.com>
Subject: Re: [PATCH v4 00/16] KVM: selftests: "tree" wide overhauls
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>, James Houghton <jthoughton@google.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_141220_671771_62DFD017 
X-CRM114-Status: GOOD (  16.13  )
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

On Wed, Dec 18, 2024, Sean Christopherson wrote:
> On Wed, 27 Nov 2024 16:55:31 -0800, Sean Christopherson wrote:
> > Two separate series (mmu_stress_test[1] and $ARCH[2]), posted as one to
> > avoid unpleasant conflicts, and because I hope to land both in kvm/next
> > shortly after 6.12-rc1 since they impact all of KVM selftests.
> > 
> > mmu_stress_test
> > ---------------
> > Convert the max_guest_memory_test into a more generic mmu_stress_test.
> > The basic gist of the "conversion" is to have the test do mprotect() on
> > guest memory while vCPUs are accessing said memory, e.g. to verify KVM
> > and mmu_notifiers are working as intended.
> > 
> > [...]
> 
> As I am running out of time before I disappear for two weeks, applied to:
> 
>    https://github.com/kvm-x86/linux.git selftests_arch
> 
> Other KVM maintainers, that branch is officially immutable.  I also pushed a tag,
> kvm-selftests-arch-6.14, just in case I pull a stupid and manage to clobber the
> branch.  My apologies if this causes pain.  AFAICT, there aren't any queued or
> in-flight patches that git's rename magic can't automatically handle, so hopefully
> this ends up being pain-free.
> 
> Paolo, here's a pull request if you want to pull this into kvm/next long before
> the 6.14 merge window.  Diff stats at the very bottom (hilariously long).

Argh!  I completely forget to build test this on non-x86, and missed that arm64
snuck in 75cd027cbcb1 ("KVM: arm64: selftests: Test ID_AA64PFR0.MPAM isn't completely 
ignored").  *sigh*

Given that I just sent out mail, I'm going to cross my fingers and hope that no
one has merged the above branch/tag.  I've deleted the branch and tags from the
remote, but kept the tag locally just in case.

Please holler if you managed to grab the broken branch/tag.  If no one screams,
I'll assume I got luckly and will push a fixed version (with different names) later
today.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
