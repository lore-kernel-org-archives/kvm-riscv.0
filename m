Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191B3CA0FF6
	for <kvm-riscv@archiver.kernel.org>; Fri, 29 Aug 2025 00:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vk07hbFCDLWVxGSloiZHJWKQ46IPmTLe7A9SaM0t4Ro=; b=AUnqDLvzDt5O9c
	SkLLyhO8dChlJEN17h5fjjZmmrjEP7vHr/ctqofaQqv6mwTFVh7q1y4tNlb6ujdMAm2Dmtxn69dzO
	4kpRUV+NKkpC9+WnMqOMUqqJy3Vy+HwwU3fSBI5EB9qqjI96VgOMj9cnOhpLwyegOfLluGL/2kJ63
	lNJVcrX3FFbY6n7VbbI20o+mXyY5lhkoxCjqwYunKO8ZctE/7LRRwe518neW+zj61TkLZZ+nRWs3j
	kQM5umTB49YLpWiFPWYWxMN3x2DJxGUkwn7FRoppLta6235ULx3ho3nCOWMME0o85BcepruAPORU7
	V4nAVchd8YqqqSjruMPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urmiC-00000003pE2-3HUq;
	Fri, 29 Aug 2025 00:11:24 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urmaa-00000003mRo-0x8r;
	Fri, 29 Aug 2025 00:03:33 +0000
Received: from [100.65.128.219] (unknown [20.236.11.69])
	by linux.microsoft.com (Postfix) with ESMTPSA id 29236211080D;
	Thu, 28 Aug 2025 17:03:30 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 29236211080D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1756425810;
	bh=NHYELJgOgtoYXMJjyiZ6Y/1BY77k4JUs4dbKzcllNgc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b/Cp3YVnPly7ZmtMQDa2AEMRoQa4CxzO0/V6ejotdr50lR5itAta36gVWEjEJkADW
	 rU7s8pjJhzWn/fR2q78z1pzSDm8R5EbcWLUxToRvAEbLWCrmz4XX39aTX/yCwcbIg0
	 s7ITLAqpkbVOXbI9g+AL0NaazVp0H0AaluYJk0kI=
Message-ID: <c1a5ab1d-1601-46db-83da-b26422a2aabd@linux.microsoft.com>
Date: Thu, 28 Aug 2025 17:03:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] Drivers: hv: Use common "entry virt" APIs to do
 work in root before running guest
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
 <20250828000156.23389-7-seanjc@google.com>
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <20250828000156.23389-7-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_170332_335454_DAC45E88 
X-CRM114-Status: GOOD (  19.70  )
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
> Use the kernel's common "entry virt" APIs to handle pending work prior to
> (re)entering guest mode, now that the virt APIs don't have a superfluous
> dependency on KVM.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  drivers/hv/Kconfig          |  1 +
>  drivers/hv/mshv_root_main.c | 32 ++++++--------------------------
>  2 files changed, 7 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/hv/Kconfig b/drivers/hv/Kconfig
> index 2e8df09db599..894037afcbf9 100644
> --- a/drivers/hv/Kconfig
> +++ b/drivers/hv/Kconfig
> @@ -66,6 +66,7 @@ config MSHV_ROOT
>  	# no particular order, making it impossible to reassemble larger pages
>  	depends on PAGE_SIZE_4KB
>  	select EVENTFD
> +	select VIRT_XFER_TO_GUEST_WORK
>  	default n
>  	help
>  	  Select this option to enable support for booting and running as root
> diff --git a/drivers/hv/mshv_root_main.c b/drivers/hv/mshv_root_main.c
> index 0d849f09160a..7c83f656e071 100644
> --- a/drivers/hv/mshv_root_main.c
> +++ b/drivers/hv/mshv_root_main.c
> @@ -8,6 +8,7 @@
>   * Authors: Microsoft Linux virtualization team
>   */
>  
> +#include <linux/entry-virt.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/fs.h>
> @@ -481,29 +482,6 @@ mshv_vp_wait_for_hv_kick(struct mshv_vp *vp)
>  	return 0;
>  }
>  
> -static int mshv_pre_guest_mode_work(struct mshv_vp *vp)
> -{
> -	const ulong work_flags = _TIF_NOTIFY_SIGNAL | _TIF_SIGPENDING |
> -				 _TIF_NEED_RESCHED  | _TIF_NEED_RESCHED_LAZY |
> -				 _TIF_NOTIFY_RESUME;
> -	ulong th_flags;
> -
> -	th_flags = read_thread_flags();
> -	while (th_flags & work_flags) {
> -		int ret;
> -
> -		/* nb: following will call schedule */
> -		ret = mshv_do_pre_guest_mode_work(th_flags);
> -
> -		if (ret)
> -			return ret;
> -
> -		th_flags = read_thread_flags();
> -	}
> -
> -	return 0;
> -}
> -
>  /* Must be called with interrupts enabled */
>  static long mshv_run_vp_with_root_scheduler(struct mshv_vp *vp)
>  {
> @@ -524,9 +502,11 @@ static long mshv_run_vp_with_root_scheduler(struct mshv_vp *vp)
>  		u32 flags = 0;
>  		struct hv_output_dispatch_vp output;
>  
> -		ret = mshv_pre_guest_mode_work(vp);
> -		if (ret)
> -			break;
> +		if (__xfer_to_guest_mode_work_pending()) {
> +			ret = xfer_to_guest_mode_handle_work();
> +			if (ret)
> +				break;
> +		}
>  
>  		if (vp->run.flags.intercept_suspend)
>  			flags |= HV_DISPATCH_VP_FLAG_CLEAR_INTERCEPT_SUSPEND;

Also tested mshv_root with 1-6 applied, looks good to me. Possibly Naman,
Saurabh, or Roman can test the mshv_vtl patches, I can't do it
unfortunately.

Tested-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Reviewed-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
