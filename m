Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0C8C79F85
	for <kvm-riscv@archiver.kernel.org>; Sun,  6 Sep 2026 17:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wbn2SItb2OEenL6pQslLnzY0jRGxVRWSlWvo6l3H5T8=; b=H2wtd1z9V8idhG
	y/iqyCl5UtsZy0s2U0FT8GcxiFlrbEvf2dsk89JNVgHR6k/bVGYVIOulg23Wx6tni9haxJXIlDG2Q
	KxTQCOEI0+ZFNtuizlktvOmzkix4PB5ky7ZBOkd0FTsEDrEs8z0CXIaIPyrASyHs9VPIy/+nyuFg9
	7VqIgQf4cdviLJpThPNg9sIsN6DsOxlPfXqn3r0K5ZIytRNx8Nr1n6oFrTO1goSs2RqW2vtkuLMMy
	FHyVILuPt3NC9SrSKB+IonrNl+Nk/4SfNsYQZTgjRPw/1SdUv94r8BWiT2rFcCd9Uir+VkrDQeERP
	LWr4SFZ0V1FhS3vbIrdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3GXi-00000005E4n-42mI;
	Sun, 06 Sep 2026 17:20:34 +0000
Received: from out-162.mta1.migadu.com ([2001:41d0:203:375::a2] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3GXe-00000005E4S-1dKl
	for kvm-riscv@lists.infradead.org;
	Sun, 06 Sep 2026 17:20:33 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=u8iacqcgJsxhNvW+ZuwYdOLqp3W13cBHeJp8kF5zX5M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788715228; v=1; x=1789320028;
 b=VSC4NYUIAW4Blz3FfYY98GnpfNACN/AJniar8Uv2EwZbIyvDjGCHWaQU8Hdvu8qUUnU1pkA+
 2mpK9bhEMKR+gdOdBk+UK7ugm4yi8Q4I8WofPWBz/yn8q6OQe6Fjt/Z0y0UrvW/8iev/c1TofQL
 VU7Eydd64MhGZoIOtfrsJnv8=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 20dc8ed5eb36f8e6;
	Sun, 06 Sep 2026 17:20:17 +0000
X-Mizu-Trace-ID: 20dc8ed5eb36f8e6
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384b7so3790e87.0
        for <kvm-riscv@lists.infradead.org>; Sun, 06 Sep 2026 10:20:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwvhNESHKJOTtcAdfnlWj+TX8RPwZMK8oJ+DUYhVaAk8wPAP3j7+Cevn2UuTpHG19FOcSYiqwhDs7E=@lists.infradead.org
X-Gm-Message-State: AFuF++kmOJ2GmcOB6mHuo+XbevovtsW2VpD1zEYxoee5ybQvdNs0kCgt
	ZI3K1b2AOMbO4iy0Nh0RarclcbWopG7tMNS0rDz5JdCEToJUYko3PbtgELQNkzuP5j/ZJIuhM4z
	7GaCQYI3We7pGKWgfsfGTRc/xj6hG1O1HdlnymzLs
X-Received: by 2002:a05:6512:2385:b0:5b1:5141:9156 with SMTP id
 2adb3069b0e04-5b74d44acb5mr105182e87.9.1788715216132; Sun, 06 Sep 2026
 10:20:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260904175550.430266-1-dongli.zhang@oracle.com> <20260904175550.430266-3-dongli.zhang@oracle.com>
In-Reply-To: <20260904175550.430266-3-dongli.zhang@oracle.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sun, 6 Sep 2026 18:19:39 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzjDysJXhuFTyRdmh3Ds23r+S+SNghUH1RYpBfwHFTJWQ@mail.gmail.com>
X-Gm-Features: AcwNN1V6wsRuawKeQC5Yrt6FrQGQC2xcq6Of0g2I-XUsUdx59PQhL1xhMAbXFWM
Message-ID: <CA+EHjTzjDysJXhuFTyRdmh3Ds23r+S+SNghUH1RYpBfwHFTJWQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] KVM: Reset last_steal on vCPU pid change
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, zhaotianrui@loongson.cn, 
	maobibo@loongson.cn, chenhuacai@kernel.org, anup@brainfault.org, 
	atish.patra@linux.dev, seanjc@google.com, pbonzini@redhat.com, 
	shuah@kernel.org, dwmw2@infradead.org, joe.jin@oracle.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_102030_589883_57187F3A 
X-CRM114-Status: GOOD (  16.64  )
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

On Fri, 4 Sept 2026 at 18:56, Dongli Zhang <dongli.zhang@oracle.com> wrote:
>
> KVM does not support vCPU hotplug. When a vCPU is removed, its
> corresponding data structures are not freed by KVM. Instead, QEMU destroys
> only the userspace state and the vCPU thread, while the KVM vCPU fd remains
> open and parked in QEMU.
>
> As a result, vcpu->last_steal is not reset.
>
> If the same vCPU is later re-created by QEMU, last_steal retains its old
> value, while current->sched_info.run_delay starts from zero since a new
> vCPU thread is created. This causes
> current->sched_info.run_delay - vcpu->last_steal to produce a large, bogus
> value.
>
> Fix this by resetting vcpu->last_steal to current->sched_info.run_delay
> when KVM vCPU PID is changed.
>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

> ---
> v1->v2:
>   - Move from kvm_arch_vcpu_run_pid_change() to its caller.
>
>  virt/kvm/kvm_main.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 65eb26a0520d..784f0d945b45 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -4478,6 +4478,10 @@ static long kvm_vcpu_ioctl(struct file *filp,
>                         if (r)
>                                 break;
>
> +#ifdef CONFIG_HAVE_KVM_PV_STEAL_TIME
> +                       vcpu->last_steal = current->sched_info.run_delay;
> +#endif
> +
>                         newpid = get_task_pid(current, PIDTYPE_PID);
>                         write_lock(&vcpu->pid_lock);
>                         vcpu->pid = newpid;
> --
> 2.43.7
>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
