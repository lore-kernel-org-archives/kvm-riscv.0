Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FA7C54F51
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 08:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AKAvpmqdj/lyoAU0j3O5sOijHHi0PNET7izEjFMC9HY=; b=XB3gCDVrMyByO2
	+YKPbYDUYwItRpc3CIJSFtfmecsLJAY9/Mf/6ajN3PqW/9cezG4HrIb8xb9Aw/aKTo0fXLhIyjJ0X
	6QjSiiVmUhCJsVhC/2VESHwZ0fU7S6eBG+FQA8PP/urIRQFRTmvObAKsxJregO/ctn9VY6aeadN1B
	7YWY0I1Ky0lZ6kC9Oewso1X1LyaLXOeebVG1QGLHAwd7r2D2kRnznQzLOjGzVy2FMAoKUV6cjdWFI
	egxi2/kHpNmfzSD46Z3o0Inr9igPOFDwbaRM/8wRxJPL0nlLs2QCfH7padEuvfv8GDlFzfQprVxqk
	Pv8dQRUKdhbHK1nUl5Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozuR-00000007GkK-15oV;
	Wed, 29 Jul 2026 08:45:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozuP-00000007Gjs-2dvT;
	Wed, 29 Jul 2026 08:45:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A577D60A5E;
	Wed, 29 Jul 2026 08:45:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8A51F000E9;
	Wed, 29 Jul 2026 08:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785314700;
	bh=D0CluIGc1MVu89QcquHLZ/G/m76BWe29aW2jG65T4pk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YQcR/QHGSnsEURic9iO4rpfgSpZLgQHaO7nqi29hGP04hwld3n0v4VkrB9yduZs4X
	 WBGk3lpCOh7oq5F0Y2tcBwISt3hlJvWf3Pvg+MgIOcSXbQTo+0Jwlxxk0YQehqj/6R
	 gzZiY7NQ+WAvtvd8FzZIk5xx8XHbX3NTghgp9ckY=
Date: Wed, 29 Jul 2026 10:44:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: anup@brainfault.org, atish.patra@linux.dev, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	security@kernel.org
Subject: Re: [PATCH] RISC-V: KVM: Synchronize hrtimer callback during teardown
Message-ID: <2026072959-penpal-petroleum-bf6e@gregkh>
References: <CAGEsz8GNHFCOZ=-_y56rK1aX+Ze7w8qVqZSQ-OuGo_dPC4bXCw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGEsz8GNHFCOZ=-_y56rK1aX+Ze7w8qVqZSQ-OuGo_dPC4bXCw@mail.gmail.com>
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

On Wed, Jul 29, 2026 at 01:42:24AM +0900, Myeonghun Pak wrote:
> The non-Sstc hrtimer callback clears next_set before its final uses of
> the enclosing vCPU.  If teardown observes next_set as false while the
> callback is still running, kvm_riscv_vcpu_timer_cancel() skips
> hrtimer_cancel() and kvm_destroy_vcpus() can free the vCPU before the
> callback enters kvm_riscv_vcpu_set_interrupt().
> 
> A guest can arm the timer with SBI TIME and request shutdown with SBI
> legacy shutdown or SRST.  A VMM that honors KVM_EXIT_SYSTEM_EVENT and
> destroys the VM supplies the teardown side of the race; no post-launch
> host ioctl is needed to arm or request teardown.
> 
> On upstream master 62cc90241548, generic KASAN reported:
> 
>   BUG: KASAN: slab-use-after-free in do_raw_spin_lock
>   Write of size 4 at addr ff60000005e58898
> 
>   kvm_riscv_vcpu_set_interrupt
>   kvm_riscv_vcpu_hrtimer_expired
>   __hrtimer_run_queues
>   hrtimer_interrupt
> 
> The object was allocated by KVM_CREATE_VCPU and freed concurrently by:
> 
>   kvm_destroy_vcpus
>   kvm_arch_destroy_vm
>   kvm_destroy_vm
>   __fput
> 
> For deterministic validation, I added mdelay(1000) immediately after
> the existing next_set = false assignment.  This only widens the
> existing post-clear callback window.  A no-delay trace build naturally
> reached the callback-after-teardown-start/before-deinit ordering in 12
> of 200 runs, but 1,500 stock-kernel stress iterations did not produce a
> KASAN report, so natural reproduction is timing-sensitive.
> 
> Always invoke hrtimer_cancel() for an initialized timer.  Preserve the
> existing -EINVAL result when the timer is no longer set, but only after
> synchronizing with a running callback.
> 
> With this patch, hrtimer_cancel() blocked for the full widened callback
> window before vCPU destruction.  KASAN reported no error in 100
> fixed-and-widened runs or 200 fix-only timing-sweep runs.
> 
> Fixes: 3a9f66cb25e1 ("RISC-V: KVM: Add timer functionality")
> Cc: stable@vger.kernel.org
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
>  arch/riscv/kvm/vcpu_timer.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> AI disclosure: I used AI assistance during the audit and am treating the
> issue as public as required by Documentation/process/security-bugs.rst.
> The reproducer and full KASAN trace have not been posted publicly and
> are available on request.

Then don't you need to add an "Assisted-by:" line to your patch?

And as you posted this publicly, no need to cc: security@kernel.org.

thanks,

greg k-h

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
