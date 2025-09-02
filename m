Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D57CA1005
	for <kvm-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 21:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ouTMqbB2SXwj9dUceo8+S/VbclmLCy7Fy2G7IFU9SDo=; b=jJDyb57RZitW8G
	v4Acjtnvaiomo7IL26vXYEpuu257y/VhAxtHfFKiOZo3h6rMzoDVSF+16qThEo6OpozmCXgQhqfHh
	nICoo/uXxJeZzpjZ65JdC+55JHTB5jf1frq8RHjGprVVbHrhBUav0qOWl1s9ieZsRN0v6T32jrVhy
	Awxo/lCmWr6Ykkq2HG5K566FTgGnmnuF1kPci0AsqAMjWq6HTHl+ruT1WifiBJYGMt48XS8to7Cwp
	8s0OD40Vnbo0lqNQiOPpMzSzMbYfGKp7DgMVst74SAEqFO/lGsjVcnmZuVI2kq2MTuJ4X14Qc4Tf7
	MBQspVxPVya6ECoj7rUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYmq-00000002BgO-3Ukz;
	Tue, 02 Sep 2025 21:43:32 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utT8f-00000000jmE-1IEo;
	Tue, 02 Sep 2025 15:41:42 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756827699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pGwYTKhGfWnlBOKIJz2ymmNYWDHnVcRdnTi9w0My2J4=;
	b=2zZ8Oasydxmvlshi+0hPu1sllPKmuKAIhq/xyqKhr/ICLKxEbNE0Y8arXmULIhFseyznbC
	NlsSLx1j+NShWRw4gbfZYL8ad5Y7lWn8tb1mtzBcqKCgFv1WeUGKNq+n7XQhESEv6T34k/
	n78/Em8081lAQ+c0FZDT1a52G86GycH2kX6jzJhFFVWxLjuPwg8RTepS8e7qQA3UHoxMNI
	+IpQnlz/nMshQLJtN/61G6QO6p2VGZrRfWPs6kIiw2HVPD/gE0RaT4ds+sXRt+9jlzH+BL
	fwA1t27rhnwV3uIP1p5Z+Vmh74rHjoSwepM5Lm9+8N4mVvRUU07myiLH1ff+xg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756827699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pGwYTKhGfWnlBOKIJz2ymmNYWDHnVcRdnTi9w0My2J4=;
	b=CbELGlnz4Ygw+ApxTHhD0Wzrjj/QAZbjUecQqluEnw1bvfySdSmzQUCOWm89MgF184XaOn
	VBamn8Ys02TYr6Bw==
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Tianrui Zhao
 <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen
 <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang
 <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui
 <decui@microsoft.com>, Peter Zijlstra <peterz@infradead.org>, Andy
 Lutomirski <luto@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Josh
 Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-hyperv@vger.kernel.org, rcu@vger.kernel.org, Nuno Das Neves
 <nunodasneves@linux.microsoft.com>, Mukesh R <mrathor@linux.microsoft.com>
Subject: Re: [PATCH v2 4/7] entry/kvm: KVM: Move KVM details related to
 signal/-EINTR into KVM proper
In-Reply-To: <20250828000156.23389-5-seanjc@google.com>
References: <20250828000156.23389-1-seanjc@google.com>
 <20250828000156.23389-5-seanjc@google.com>
Date: Tue, 02 Sep 2025 17:41:37 +0200
Message-ID: <87wm6gzwsu.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_084141_480225_6A21FE1C 
X-CRM114-Status: GOOD (  12.36  )
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

On Wed, Aug 27 2025 at 17:01, Sean Christopherson wrote:
> Move KVM's morphing of pending signals into userspace exits into KVM
> proper, and drop the @vcpu param from xfer_to_guest_mode_handle_work().
> How KVM responds to -EINTR is a detail that really belongs in KVM itself,
> and invoking kvm_handle_signal_exit() from kernel code creates an inverted
> module dependency.  E.g. attempting to move kvm_handle_signal_exit() into
> kvm_main.c would generate an linker error when building kvm.ko as a module.
>
> Dropping KVM details will also converting the KVM "entry" code into a more
> generic virtualization framework so that it can be used when running as a
> Hyper-V root partition.
>
> Lastly, eliminating usage of "struct kvm_vcpu" outside of KVM is also nice
> to have for KVM x86 developers, as keeping the details of kvm_vcpu purely
> within KVM allows changing the layout of the structure without having to
> boot into a new kernel, e.g. allows rebuilding and reloading kvm.ko with a
> modified kvm_vcpu structure as part of debug/development.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
