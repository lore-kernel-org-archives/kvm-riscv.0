Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05A4C36002
	for <kvm-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 19:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=TaTr1zUtl/zRZM2RiEkiT6/WxiING+KReeffgFA4XYM=; b=Xz4rg/MLp+RDqpTybsjZhWNaVV
	+83XgeH69PS8kd12iaUEl6COYSOWYWFDDdyundHdUtvOctmDndHpyvlnEh3FHXg/l7t+PzKVgYv/A
	ObxzlP3/gMLVPEl551xOTaVgdChIz22+h+CVGCYYsJq6eD1FAnE1v87B7zvwgu4uA37Q/viUn56ln
	Qxu85pDKdtH2GeS/iaJCfOLbUicW8OPusq+GwsnA/GN2Liacs0fIcu+xRtTEzKAV9Sqmo/fGkKjNJ
	HAXG5ESJajQ/Rz7ykf6WxT8xuCYn20P0ZEzVZ0qN1tWcfNU6a1ETfif2gfbqdxXENW0oKqlTgeb9Y
	GlFEPVVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2bXd-00000008NAP-0flc;
	Wed, 09 Apr 2025 19:56:57 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2bUc-00000008MLJ-3DI6
	for kvm-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 19:53:52 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-72f3b4c0305so16826b3a.0
        for <kvm-riscv@lists.infradead.org>; Wed, 09 Apr 2025 12:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744228429; x=1744833229; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=B/LBm3aV4zfAmxi92/BK6RmsqnpaBnCdXpzKq52/Foc=;
        b=M+8Po/r2eDHj9Ljj+9u17dyGObnKIIy7KWFCJHDd+UaMYJ4vXjpTIwZ1uWwtnCNftN
         JJa54fhDWhOXiq+eOuQRkbhLHYB26dqu0/kcb5cs8pMs3WskroxgrP00V/wxZsa6Xa0Y
         4p6C0RQVDETRIuLw3kH7QfUhGLUlzGlPK8yrtZCCplghhBS8GRLpJb2CMinQGLN7HX7I
         s0ro7u1WDjIax2AFudZ5kHQgT3u5IRMxokmAz5wFQqwqONDtHDYW4uDxsL9I+LopQCTl
         mv+2fzmfGJfRX0SfUwdV9Ig88ciwaf4HQokenOSZSFERiilc71Pb8d7a+O5XdQ/dEf0T
         Gsjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744228429; x=1744833229;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B/LBm3aV4zfAmxi92/BK6RmsqnpaBnCdXpzKq52/Foc=;
        b=g8Uw7gTlfBDuGA3NzunjN2A3hmLw7fO3DGvOiUyOtOIqWCADtvEcdA39t22As/roXy
         Pd9kdF1OhOqU8wF4eeVjTw8/PuraVk+skxsJJfXKTkJPf9rjFje4n1k+53mk+YG/ihMW
         K33yLsBdAULxGkYZkmekT8RHTYGyU+Jjeu5EKAEjKh+155fr5/l+2BTMxVhnWm2+rK8+
         7GlKD4GPemWkTA17xoDUdY7n8TkkRLBXDbQhV04dBftvH4WHWXE8uYLGpFOWkg1VFFI1
         8Y7cbx+hksz92kkG4marCd2PBd6VOX9/rkq9RkhWShUaK1TtGDABJWoWTpgEVWRWYLOo
         YUPw==
X-Forwarded-Encrypted: i=1; AJvYcCVogZ8rK5pa4blNysxGPWIdw4lgzaiaKt16YEwkbrDXD34mzvMwyq03SrTmp1b/kze9ELJly2RiKxw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxbW4hq1esAl4xpLz8rIPPvMx/b/gHumg77a7qtzufy5CtAvaun
	6dLXhqVe4ZyGo4CUpwkLKe/6aOUS0y4IM7cljvmhEnkCB5IOt5nsTwmAhCwCgo9AeRg3vzeiDca
	UDw==
X-Google-Smtp-Source: AGHT+IEeESm/upruWypiAiAFjj3gqiD2FWPZpn5Oi58JT7YjI+D2LtDvdvxhwdzcKYcXLoDvWUFBt/R8XtU=
X-Received: from pfkq6.prod.google.com ([2002:a05:6a00:846:b0:737:6e43:8e34])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:130c:b0:736:bfc4:ef2c
 with SMTP id d2e1a72fcca58-73bbec49ac8mr221785b3a.0.1744228428902; Wed, 09
 Apr 2025 12:53:48 -0700 (PDT)
Date: Wed, 9 Apr 2025 12:53:47 -0700
In-Reply-To: <20250409014136.2816971-1-mlevitsk@redhat.com>
Mime-Version: 1.0
References: <20250409014136.2816971-1-mlevitsk@redhat.com>
Message-ID: <Z_bQS63A2bd-LzgQ@google.com>
Subject: Re: [PATCH v2 0/4] KVM: extract lock_all_vcpus/unlock_all_vcpus
From: Sean Christopherson <seanjc@google.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: kvm@vger.kernel.org, Alexander Potapenko <glider@google.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, kvm-riscv@lists.infradead.org, 
	Oliver Upton <oliver.upton@linux.dev>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Jing Zhang <jingzhangos@google.com>, Waiman Long <longman@redhat.com>, x86@kernel.org, 
	Kunkun Jiang <jiangkunkun@huawei.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Zenghui Yu <yuzenghui@huawei.com>, 
	Borislav Petkov <bp@alien8.de>, Alexandre Ghiti <alex@ghiti.fr>, 
	Keisuke Nishimura <keisuke.nishimura@inria.fr>, Sebastian Ott <sebott@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Will Deacon <will@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Andre Przywara <andre.przywara@arm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Adrian Hunter <adrian.hunter@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_125350_798369_E46A5F3E 
X-CRM114-Status: GOOD (  16.60  )
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

+Adrian

On Tue, Apr 08, 2025, Maxim Levitsky wrote:
> Implement Paolo's suggestion of reusing

Ha!  I *knew* this felt familiar when I suggested extracting (un)lock_all_vcpus()
to common code in the context of the TDX series.

https://lore.kernel.org/all/Z-V0qyTn2bXdrPF7@google.com

> sev_lock/unlock_vcpus_for_migration in arm and riscv code
> for the purpose of taking vcpu->mutex of all vcpus of a VM.
> 
> Because sev_lock/unlock_vcpus_for_migration already have a workaround
> for lockdep max lock depth, this fixes the lockdep warnings on arm
> which were the inspiration for this refactoring.
> 
> This patch series was only compile tested on all 3 architectures.
> 
> V2: added trylock option to kvm_lock_all_vcpus to be better compatible
> with the orginal code.
> 
> Best regards,
> 	Maxim Levitsky
> 
> Maxim Levitsky (4):
>   locking/mutex: implement mutex_trylock_nested
>   KVM: x86: move sev_lock/unlock_vcpus_for_migration to kvm_main.c
>   KVM: arm64: switch to using kvm_lock/unlock_all_vcpus
>   RISC-V: KVM: switch to kvm_lock/unlock_all_vcpus
> 
>  arch/arm64/include/asm/kvm_host.h     |  3 --
>  arch/arm64/kvm/arch_timer.c           |  4 +-
>  arch/arm64/kvm/arm.c                  | 43 ----------------
>  arch/arm64/kvm/vgic/vgic-init.c       |  4 +-
>  arch/arm64/kvm/vgic/vgic-its.c        |  8 +--
>  arch/arm64/kvm/vgic/vgic-kvm-device.c | 12 ++---
>  arch/riscv/kvm/aia_device.c           | 34 +------------
>  arch/x86/kvm/svm/sev.c                | 65 ++----------------------
>  include/linux/kvm_host.h              |  6 +++
>  include/linux/mutex.h                 |  8 +++
>  kernel/locking/mutex.c                | 14 ++++--
>  virt/kvm/kvm_main.c                   | 71 +++++++++++++++++++++++++++
>  12 files changed, 116 insertions(+), 156 deletions(-)
> 
> -- 
> 2.26.3
> 
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
