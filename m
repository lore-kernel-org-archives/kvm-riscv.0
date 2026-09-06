Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AFBC79F85
	for <kvm-riscv@archiver.kernel.org>; Sun,  6 Sep 2026 17:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O2q4xrjtkkNp6HoIOAnZmfGCIV3M5YHOUKx0DSjA59s=; b=4xf83rapNCa/TZ
	PwEMRFvUknIduHRK1dAVCZVXFL0E8A6OMPmG5qqsEIiIJBxULzVqoHEKIpw9+4RrNJIpHLoPDEWpz
	McFgQ5yuRAj9y2nDQkIPYkhT54a+KDinQWatUo2eaLZtnW0xUXpnPBguQaltKdAkoBcXTKph5ny13
	W9LsuFiSfXA3TEDkS+gNvCqwhNpPsEavbB+Uiw0vIdMZ+XjsaiQSoRyT3K7a1URBeKFzzVUUlPWRl
	ldVjBgNhYXL3ekHYurjmrzbel7eGdGkmmLbl5g4U0K8qNqtQ4lKHLU/4iQ2LFtBd0lr15aSDM5R9i
	YEzL10KFYbUjSbfhSCqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3GJI-00000005DcK-1ZER;
	Sun, 06 Sep 2026 17:05:40 +0000
Received: from out-235.mta0.migadu.com ([2001:41d0:1004:224b::eb] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3GJF-00000005Dbz-0bUi
	for kvm-riscv@lists.infradead.org;
	Sun, 06 Sep 2026 17:05:38 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Jot0d4tdAX4ga7oGrQxB+O2Nf0GAD5rK+9m4nrHPeww=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788714334; v=1; x=1789319134;
 b=n03qPJnuCiLAK0iJgGlIFTT44qEiirBuPNQvJGfguFW3GIwXXS/VvXgxXtpKomiTARN/s545
 7LEZgilsO0SVBo1COs15QLdcL//ouAC2XuSsTk+arzEUDOym/6DpH4vOuG4e1Q/4XVRnFIOFbc0
 Be6JXTq+eFDht9SDfA3b715Y=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id cfddd2203ce03f77;
	Sun, 06 Sep 2026 17:05:34 +0000
X-Mizu-Trace-ID: cfddd2203ce03f77
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b17358so3165e87.1
        for <kvm-riscv@lists.infradead.org>; Sun, 06 Sep 2026 10:05:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzX82Ex5MFBR8fvLBnIpf8gwm7NhZuZVot3dCiOCC9EfE3n9QbOdIr/s4m8RVbrp7rHJ6yvbLyLebI=@lists.infradead.org
X-Gm-Message-State: AFuF++mk9L6F8VVc9RqOhbVcfLUkg0q0n+e1Ysa0slsV2L+dHyz24Z3f
	x3dkfnKlnVuetDxoR4IDUen9S4FGPPjDl+GVvnqQhVKsU3+d6Odp7fF9Wh7z5u4r0WovkgbH6Dq
	LMA/GYzyTr2/6L18AKi9fPuaDAjk43cNAHgPwtC0G
X-Received: by 2002:a05:6512:3185:b0:5b6:19c6:a91b with SMTP id
 2adb3069b0e04-5b74d1e0c5bmr121728e87.14.1788714331510; Sun, 06 Sep 2026
 10:05:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260904175550.430266-1-dongli.zhang@oracle.com>
In-Reply-To: <20260904175550.430266-1-dongli.zhang@oracle.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sun, 6 Sep 2026 18:04:55 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzfJz-Svda-Fia5ZS30U4hTDu+S2OfieGM7qWWpT=Jj=g@mail.gmail.com>
X-Gm-Features: AcwNN1VP4_TDp5r8i9di6gzQC14e3bohlNpxyyJkOQ7W-Gf2v9WuUtmDgfuRj38
Message-ID: <CA+EHjTzfJz-Svda-Fia5ZS30U4hTDu+S2OfieGM7qWWpT=Jj=g@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] KVM: Reset steal time accounting on vCPU pid change
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, zhaotianrui@loongson.cn, 
	maobibo@loongson.cn, chenhuacai@kernel.org, anup@brainfault.org, 
	atish.patra@linux.dev, seanjc@google.com, pbonzini@redhat.com, 
	shuah@kernel.org, dwmw2@infradead.org, joe.jin@oracle.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_100537_396788_035A87D9 
X-CRM114-Status: GOOD (  27.29  )
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

Hi Dongli,

On Fri, 4 Sept 2026 at 18:56, Dongli Zhang <dongli.zhang@oracle.com> wrote:
>
> v1: https://lore.kernel.org/all/20260816053630.527528-1-dongli.zhang@oracle.com
>
> v1->v2:
>   - move the last_steal field in the main vcpu structure (suggested by
>     Marc Zyngier).
>   - Reset last_steal from the caller of kvm_arch_vcpu_run_pid_change().

I built and ran the series on QEMU/arm64: the new
steal_time_change_pid selftest and the existing steal_time selftest
both pass, and non-protected and protected guest boots are clean.

Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

>
> KVM does not support vCPU hotplug. When a vCPU is removed, its
> corresponding data structures are not freed by KVM. Instead, QEMU destroys
> only the userspace state and the vCPU thread, while the KVM vCPU fd remains
> open and parked in QEMU.
>
> As a result, vcpu->arch.st.last_steal is not reset. If the same vCPU is
> later re-created by QEMU, last_steal retains its old value, while
> current->sched_info.run_delay starts from zero since a new vCPU thread is
> created. This causes current->sched_info.run_delay - vcpu->arch.st.last_steal
> to produce a large, bogus value.
>
> For instance, current->sched_info.run_delay can become smaller than
> vcpu->arch.st.last_steal (see line 3804) if a QEMU vCPU is re-added after
> it has previously been removed.
>
> As a result, st->steal restarts from a very small value, close to
> current->sched_info.run_delay.
>
> 3720 static void record_steal_time(struct kvm_vcpu *vcpu)
> 3721 {
> ... ...
> 3803         unsafe_get_user(steal, &st->steal, out);
> 3804         steal += current->sched_info.run_delay -
> 3805                 vcpu->arch.st.last_steal;
> 3806         vcpu->arch.st.last_steal = current->sched_info.run_delay;
> 3807         unsafe_put_user(steal, &st->steal, out);
>
>
> This patchset resets last_steal when the vCPU PID changes, as suggested by
> Sean.
>
> Although David suggested accounting the run_delay left over from the
> previous vCPU PID, this series does not do that. It would be easy to make
> that work if KVM could simply assume every transition is a vCPU PID change.
> In practice, KVM does not always have enough information about the previous
> vCPU PID, e.g. after live migration, unless a new ioctl is introduced. For
> now, this series simply resets last_steal.
>
> Although David also suggested doing the same for Xen-on-KVM vCPUs, this
> series does not reset last_steal for Xen vCPUs. That change itself would
> not be difficult, but Xen uses a different mechanism to account downtime,
> including runnable time and offline time when a vCPU is not running. It may
> therefore need no additional ioctl, or a smaller ioctl extension, to account
> run_delay left over from the previous PID.
>
> As I have access to only x86 and arm64 KVM hosts, I created and validated
> the selftest on those two architectures only.
>
> Dongli Zhang (4)
>   KVM: Move last_steal to common struct kvm_vcpu
>   KVM: Reset last_steal on vCPU pid change
>   KVM: selftests: Test steal time across vCPU pid changes on x86
>   KVM: selftests: Add arm64 coverage for steal time pid changes
>
>  arch/arm64/include/asm/kvm_host.h               |   1 -
>  arch/arm64/kvm/Kconfig                          |   1 +
>  arch/arm64/kvm/pvtime.c                         |   8 +-
>  arch/loongarch/include/asm/kvm_host.h           |   1 -
>  arch/loongarch/kvm/Kconfig                      |   1 +
>  arch/loongarch/kvm/exit.c                       |   2 +-
>  arch/loongarch/kvm/vcpu.c                       |   6 +-
>  arch/riscv/include/asm/kvm_host.h               |   1 -
>  arch/riscv/kvm/Kconfig                          |   1 +
>  arch/riscv/kvm/vcpu_sbi_sta.c                   |  10 +-
>  arch/x86/include/asm/kvm_host.h                 |   1 -
>  arch/x86/kvm/Kconfig                            |   1 +
>  arch/x86/kvm/x86.c                              |   5 +-
>  include/linux/kvm_host.h                        |   4 +
>  tools/testing/selftests/kvm/Makefile.kvm        |   2 +
>  .../selftests/kvm/steal_time_change_pid.c       | 216 +++++++++++++++++++
>  virt/kvm/Kconfig                                |   3 +
>  virt/kvm/kvm_main.c                             |   4 +
>  18 files changed, 248 insertions(+), 20 deletions(-)
>
> base-commit: 8ab1afb2eb246ab15b301cd255b5943d208a93c1
>
> Thank you very much!
>
> Dongli Zhang
>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
