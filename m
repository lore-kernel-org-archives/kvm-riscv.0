Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35B6C3601E
	for <kvm-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 08:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eH4gHaOUzRREve4DBUGtGh8FNYcXJR96asbAeDq+vx0=; b=x545owFytZkXGC
	Kvoapgb+WonOg7FVMMhn9+EVIoU9UTLQloJqbpwoB+L0O6u1cGLfYxIGqq3k2pbQfypsTkunJQEuH
	2AdQuimHLahbkH5LYsHz+28FuGE9AJX2BKT2VACn2GDu7VUt32MMRPBaJxTAMoTknmSBjZvdfsXO7
	zYjbIWdyfiwxZBuIgsJI5ppeGBKzQwoPXMFD1oZKJjGUGmC34bhJlroZXctoo7RZnD5TCjku/NJDQ
	3J9/SCBtGAzp7rzhr2cNkKRzPfEzzIx6od9dBRiPAdXvhU1yPii9RiTIAcSwD0OdwM+bY8peYFU9K
	rDcemkAnL+n7xrJGX94w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2nLz-00000009lNI-1n5n;
	Thu, 10 Apr 2025 08:33:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2muB-00000009fU1-3Hxv;
	Thu, 10 Apr 2025 08:04:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IxulY4YfJFvqSV0YcsQj0eRPgqF4sDaqNqzwMhtD+DE=; b=d4zbEXAZ3d/QRC8bB/J3SExnty
	QEX5mVTXHvr3hTke0gOWXdwujtWBsMo2SO9ZAcp+fejjIioku3evoFzJNDHQFBr8TpZ2Deg8TmOJH
	HXOgTQv24RyAQs4XcI8iC3uoPRUjvN3nETceXW5QHkxtJORwYrc0f7Y5vGtrH4fSTtdbtdKHBNydq
	XYY++T3RSc57LMajsKWy++nyiOzLKGxOXHeTTNljJFtjBpZpoaPpGIPJGZwI5qM2RtMooEhlNcCdb
	AorRjWui1N49jKz1r7D7uzAmJ5m5pTqlT3kO08GCw4jrjexs/Fq4/GpZOnRJoXUnSsSArSx/cwRkt
	jpwjaypw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2mu6-00000008mGw-3557;
	Thu, 10 Apr 2025 08:04:55 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 49F433003FF; Thu, 10 Apr 2025 10:04:54 +0200 (CEST)
Date: Thu, 10 Apr 2025 10:04:54 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: kvm@vger.kernel.org, Alexander Potapenko <glider@google.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	kvm-riscv@lists.infradead.org,
	Oliver Upton <oliver.upton@linux.dev>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Jing Zhang <jingzhangos@google.com>,
	Waiman Long <longman@redhat.com>, x86@kernel.org,
	Kunkun Jiang <jiangkunkun@huawei.com>,
	Boqun Feng <boqun.feng@gmail.com>, Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Zenghui Yu <yuzenghui@huawei.com>,
	Borislav Petkov <bp@alien8.de>, Alexandre Ghiti <alex@ghiti.fr>,
	Keisuke Nishimura <keisuke.nishimura@inria.fr>,
	Sebastian Ott <sebott@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Randy Dunlap <rdunlap@infradead.org>, Will Deacon <will@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>, Ingo Molnar <mingo@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sean Christopherson <seanjc@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v2 1/4] locking/mutex: implement mutex_trylock_nested
Message-ID: <20250410080454.GW9833@noisy.programming.kicks-ass.net>
References: <20250409014136.2816971-1-mlevitsk@redhat.com>
 <20250409014136.2816971-2-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250409014136.2816971-2-mlevitsk@redhat.com>
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

On Tue, Apr 08, 2025 at 09:41:33PM -0400, Maxim Levitsky wrote:
> Allow to specify the lockdep subclass in mutex_trylock
> instead of hardcoding it to 0.

We disable a whole bunch of checks for trylock, simply because they do
not wait, therefore they cannot deadlock.

But I can't remember if they disable all the cases required to make
subclasses completely redundant -- memory suggests they do, but I've not
verified.

Please expand this Changelog to include definite proof that subclasses
make sense with trylock.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
