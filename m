Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D012BC4450F
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 06:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M/67JCJjufTXYlUgtRxE0cnG+eDwrfsOhh8+cU03lcw=; b=GXE1Nz+e6X/f+3
	DoMyBO6ylvlgkr9v6kYGkzJ7YOR7kz+R7fNG85c6j7rNf8gWVMYB8x6fZhJhS3wtqHvlXxE1PLi0H
	7HbrtojLKi913CBfNHHkGhatbDaJXg7z6PzzRKgnHe/RGT+RRK6fIg4IY5mpkyaVvy9tx2QmLiIfE
	FKH78ZhYDCi2/b8giGqmoYnM3BMKjUl0YohWm9la+41G7I6xbLRBGCNiRBY7Mo7etiicYrhLG51/C
	PYQJXQhs48DIMyPspis3/7zVBptv8+IEnyaAR2KMndBxGNiyQE8Xkli3jSNodsUi8U3WAv+KeTxFh
	OtqyqeZ+gobNglJtaboQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcQE-00000001Izs-1Z68;
	Fri, 17 Jul 2026 06:51:46 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcQC-00000001Iyu-0Jfd;
	Fri, 17 Jul 2026 06:51:45 +0000
Date: Fri, 17 Jul 2026 08:51:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784271098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iHloH8eQez70XTBWP+YOYs861I04WwMlKGR/B+8UyX8=;
	b=uRQvpXx+VHdKwA2Zj2s2fbig4bRKStK7eaDY1daStzkR7P22iO9Wv/mOHOYI+rtZw+b8CS
	OzvGBYweVqeYmrgTzjfH/1muSHvA+JyIJ/lMIXJzByR7Rbcdoy+ctwHWbLdaUFoCsStAhK
	/76Jzaflrb91HsjSkPf9dv0Shr5t4ZuPVhDoy4L9w7JhEZRGQOQMPjgtutOeQCOE2Zk9y4
	PyeZhpOUAkFXEUgRc+d4PAlG8u8sKDu6xs7vo0AkhZeejAMtP/kNINsrDxnNxgtRjgu6U+
	OS7k2r+py4/9210hQi+pGc7p/v3ZsuKRiA/QQ+ZorhGk7yJIgkSPo2yX2jiiAw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784271098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iHloH8eQez70XTBWP+YOYs861I04WwMlKGR/B+8UyX8=;
	b=k/6lWgISwZ5cyfj3K2nN/MhzIKDOdKXhc2tWD6i0TuTGy3ssBlaCDjfo5BfTemhyzIQH/F
	6FbjUnX0tN/c0+BA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: yhchen312@gmail.com
Cc: anup@brainfault.org, atish.patra@linux.dev, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	clrkwllms@kernel.org, rostedt@goodmis.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: Re: [PATCH] RISC-V: KVM: Use raw_spinlock for VMID update critical
 section
Message-ID: <20260717065137.FQ5Ax2W-@linutronix.de>
References: <20260716064011.2387501-1-yhchen312@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260716064011.2387501-1-yhchen312@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_235144_267950_7A6DD31A 
X-CRM114-Status: UNSURE (   5.71  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On 2026-07-16 14:40:11 [+0800], yhchen312@gmail.com wrote:
> From: "Yuhang.chen" <yhchen312@gmail.com>
> 
> The VMID update critical section performs an IPI broadcast via
> on_each_cpu_mask() on VMID version rollover, which must not be preempted
> under PREEMPT_RT.

Here you state _why_ it must not be preempted. What would be the worst
that could happen.

>                   Convert vmid_lock to raw_spinlock_t and use plain
That part starting with "Convert" belongs into into a new line.

> raw_spin_lock()/raw_spin_unlock() (interrupts stay enabled, since
> on_each_cpu_mask() requires it).
> 
> Assisted-by: YuanSheng:deepseek-v4-pro
> Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Signed-off-by: Yuhang.chen <yhchen312@gmail.com>

Sebastian

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
