Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66452CA0FF6
	for <kvm-riscv@archiver.kernel.org>; Thu, 28 Aug 2025 23:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=za39H7FcroRUdOegM69guGFyGLSm+e+5RxybRN7+0As=; b=mA6YNLRvjYVNXo
	fzNmovpxlP2IMiTTB8lTbEmvV1jm5rdkbqRjc+TwfAsDUx21OTUByEzDBtvPdPOCQTUvUBnekFKMn
	g65tvOu2mf8Jkoylct962A1UhcQLE86S+RWDi9de8MXrPOqHb4i4CZIMo750yXiaJm67qIieOrUvP
	gW1+V0HBugYdVechi6zumhJNJWYWcBL0HEKuRDiIXYaGHq/JOSuyNE6bTHc/KzFIhhNzf4q+BZcRZ
	sgnESjghfvRHuxA26anKbX1GttML+fI5wmyOO528IpCNBtnT9CslrDngWiUxqviTl5NZl+yZiw2qw
	gRkg8l4tHACXP7a4768g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urmTr-00000003k4R-3gJc;
	Thu, 28 Aug 2025 23:56:35 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urmTq-00000003k3t-0XJC;
	Thu, 28 Aug 2025 23:56:35 +0000
Received: from [100.65.128.219] (unknown [20.236.11.69])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6157F2110814;
	Thu, 28 Aug 2025 16:56:31 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6157F2110814
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1756425392;
	bh=pCexqDkoW83y7LpImpFx62Xw3cNxneYeXhAEgKffuKE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FCmBOZwwR8w+zLgYvdYsQndKdjVa/Zic9g+xriRNGxIyvlCW/6jpNTSZnJfm6AeYV
	 w2ojPM1lFjNBJBy+LYvZF2V3PzDSbQwMQWAu7ekzKLIlFXUd3JJs7xNFRWV7yBhSjO
	 k2ChjjpZ1AKeJCgw2XX5B7Ss1Fvkq4e5nLRu23ks=
Message-ID: <0b4eb0cc-657f-4cdb-8255-e3b8f6b14077@linux.microsoft.com>
Date: Thu, 28 Aug 2025 16:56:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] Drivers: hv: Handle NEED_RESCHED_LAZY before
 transferring to guest
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Peter Zijlstra <peterz@infradead.org>,
 Andy Lutomirski <luto@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
 Joel Fernandes <joelagnelf@nvidia.com>, Josh Triplett
 <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-hyperv@vger.kernel.org, rcu@vger.kernel.org,
 Mukesh R <mrathor@linux.microsoft.com>
References: <20250828000156.23389-1-seanjc@google.com>
 <20250828000156.23389-2-seanjc@google.com>
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <20250828000156.23389-2-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_165634_226782_853EAD5E 
X-CRM114-Status: GOOD (  17.09  )
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

On 8/27/2025 5:01 PM, Sean Christopherson wrote:
> Check for NEED_RESCHED_LAZY, not just NEED_RESCHED, prior to transferring
> control to a guest.  Failure to check for lazy resched can unnecessarily
> delay rescheduling until the next tick when using a lazy preemption model.
> 
> Note, ideally both the checking and processing of TIF bits would be handled
> in common code, to avoid having to keep three separate paths synchronized,
> but defer such cleanups to the future to keep the fix as standalone as
> possible.
> 
> Cc: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> Cc: Mukesh R <mrathor@linux.microsoft.com>
> Fixes: 621191d709b1 ("Drivers: hv: Introduce mshv_root module to expose /dev/mshv to VMMs")
> Fixes: 64503b4f4468 ("Drivers: hv: Introduce mshv_vtl driver")
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  drivers/hv/mshv_common.c    | 2 +-
>  drivers/hv/mshv_root_main.c | 3 ++-
>  drivers/hv/mshv_vtl_main.c  | 3 ++-
>  3 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hv/mshv_common.c b/drivers/hv/mshv_common.c
> index 6f227a8a5af7..eb3df3e296bb 100644
> --- a/drivers/hv/mshv_common.c
> +++ b/drivers/hv/mshv_common.c
> @@ -151,7 +151,7 @@ int mshv_do_pre_guest_mode_work(ulong th_flags)
>  	if (th_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
>  		return -EINTR;
>  
> -	if (th_flags & _TIF_NEED_RESCHED)
> +	if (th_flags & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY))
>  		schedule();
>  
>  	if (th_flags & _TIF_NOTIFY_RESUME)
> diff --git a/drivers/hv/mshv_root_main.c b/drivers/hv/mshv_root_main.c
> index 932932cb91ea..0d849f09160a 100644
> --- a/drivers/hv/mshv_root_main.c
> +++ b/drivers/hv/mshv_root_main.c
> @@ -484,7 +484,8 @@ mshv_vp_wait_for_hv_kick(struct mshv_vp *vp)
>  static int mshv_pre_guest_mode_work(struct mshv_vp *vp)
>  {
>  	const ulong work_flags = _TIF_NOTIFY_SIGNAL | _TIF_SIGPENDING |
> -				 _TIF_NEED_RESCHED  | _TIF_NOTIFY_RESUME;
> +				 _TIF_NEED_RESCHED  | _TIF_NEED_RESCHED_LAZY |
> +				 _TIF_NOTIFY_RESUME;
>  	ulong th_flags;
>  
>  	th_flags = read_thread_flags();
> diff --git a/drivers/hv/mshv_vtl_main.c b/drivers/hv/mshv_vtl_main.c
> index dc6594ae03ad..12f5e77b7095 100644
> --- a/drivers/hv/mshv_vtl_main.c
> +++ b/drivers/hv/mshv_vtl_main.c
> @@ -728,7 +728,8 @@ static int mshv_vtl_ioctl_return_to_lower_vtl(void)
>  	preempt_disable();
>  	for (;;) {
>  		const unsigned long VTL0_WORK = _TIF_SIGPENDING | _TIF_NEED_RESCHED |
> -						_TIF_NOTIFY_RESUME | _TIF_NOTIFY_SIGNAL;
> +						_TIF_NOTIFY_RESUME | _TIF_NOTIFY_SIGNAL |
> +						_TIF_NEED_RESCHED_LAZY;
>  		unsigned long ti_work;
>  		u32 cancel;
>  		unsigned long irq_flags;

Tested by compiling with CONFIG_PREEMPT_LAZY=y and booting a guest. For
the test I added a check to confirm _TIF_NEED_RESCHED_LAZY was set and
honored.

Looks good, thanks.

Tested-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Reviewed-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
