Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A92CD4F3C
	for <kvm-riscv@archiver.kernel.org>; Mon, 18 May 2026 13:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=r3gfzEdjdx2lI/5HzjQlLsJWW/+1xX2ED1N712COG4E=; b=boncl7MZFrTkAboum/cApvEGOM
	iIcs9wfC+1PTRI+bzhIKzAtbJkX6w1LdJ7MnlbF2xe0AHBnasTjmvI0OaXlZnzvpFjBjOykbpqAsq
	6YSUREkiqTYhPnwGbf2lHryRjtNLo0IHUiZhcZ0g5GaN11oLES3vs/zxX0q1itl0zdMXzAGYT/FlA
	eMaxHXJiPeL6GsodnzvjV5cni6PgA7UwIFkMDPCougDyNg8788lGRse+apSMmCwcPACcR+MZgT5Dr
	6iW13oZjcDzmgSPKgFdyjSwVcKM3H1eqEmgqXSYNVp20fJzrVpLdgaBgd/97Vcn5NzsxD5ZMs11PT
	SrKqP3eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxy1-0000000FoB9-1qrl;
	Mon, 18 May 2026 13:25:09 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxxz-0000000FoA2-1DUO
	for kvm-riscv@lists.infradead.org;
	Mon, 18 May 2026 13:25:08 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-36642d2f4deso5132730a91.3
        for <kvm-riscv@lists.infradead.org>; Mon, 18 May 2026 06:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779110705; x=1779715505; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=U8qoVNkOwHjXFecSlVoxGZKKrJQ+Chvyfnc0mBlOZlI=;
        b=ALrHyq3zwRog2FEo+ApoM+auYm8LW955ldbZ8JjeZ4d5+r0ANEkneXI8ukyJcr5zuw
         T5QpYpYyDj1SPitBL20y3AXBGIVdtdRj41nmdZGqme+gFnAl0p56p0BFpMhOW+MkTg4M
         gTZnoa8PItFMa9+fcQ9qL+fVXSuGzdo/ZeF006Bi3h5sMvpl9EptAqagF/oONysz6LOh
         Cdp20+NurtyETKKchB4CYohKlqzLvXsX9cmQXRK/3UgeFGqVhJS4kA21diCz+FkUBR5/
         cBnFWdki26NvP9/pJ/S4/nIyJE/w4H6MVNvahCzoDW85xBJmbzPUVPog7lppDFWCbgCX
         p31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779110705; x=1779715505;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U8qoVNkOwHjXFecSlVoxGZKKrJQ+Chvyfnc0mBlOZlI=;
        b=r/6kWeMA3AgQ9TduCx5pFvz7xKTDYoXJ92qTOiQlnMcd2ODNGXeZR9g9AEi/KpHjHQ
         ItfXBuw9i9v2/xUQkvzqhZ+YpuNRSXAG+vWDu2P9N0A7YbiW1PsD5jbE71eyuBN509Eq
         FIIH0V0eYig/BT/dB0o+E3GJjwdN8gK5hUvi1PQPXZNd+XP1v86QHLfrB2P8SOm+C247
         pyEhFYjXGsQjNZWimmy041npAACZ8xqopiqFU3BJMVuBDhORuQVcHDLUR3DtgXU8cTsE
         6MtIcm8DQcIYajZ4eGTlxasy62rG2RNRGpAq4K4pieZVIDWjPve7Oy6uD4nNPpEGQJGE
         VZdA==
X-Forwarded-Encrypted: i=1; AFNElJ9yW0YhrkgImEfrzeUncT58M+T8vOCiUdeb11iyP/beF75eDejstxUsSL2z9erpYUTbZ//Aarl39yQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzFgZmxBYIHhCNeZyu/al52VPRDy7wXvqVqw5tPC49u9XkVq37V
	46pyyKUsa9esv+elz2BnedJj5NkQyj6/K+hyoMtQ4WMSCowH7EkkFnBkyC4naoz1GuIspJwgFRE
	AW4tp4A==
X-Received: from pgbbw2.prod.google.com ([2002:a05:6a02:482:b0:c80:24e3:5130])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:c14d:10b0:3b2:698b:cf4
 with SMTP id adf61e73a8af0-3b2698b0d27mr6157278637.44.1779110705325; Mon, 18
 May 2026 06:25:05 -0700 (PDT)
Date: Mon, 18 May 2026 06:25:03 -0700
In-Reply-To: <22e32ff9-3d79-4130-a3cb-3a4ec2efd498@163.com>
Mime-Version: 1.0
References: <202605111849442561v1a0B_7W1L2Z-ENusLaP@zte.com.cn>
 <202605111130.64BBUXDN013040@mse-fl2.zte.com.cn> <agO_0ejKd0x38_-E@google.com>
 <f64029bf-1f4c-40a7-860a-eb04fbe5317b@163.com> <agck1WqW-TyEqkqd@google.com> <22e32ff9-3d79-4130-a3cb-3a4ec2efd498@163.com>
Message-ID: <agsTL_viyxDjamX9@google.com>
Subject: Re: [PATCH 1/3] KVM: selftests: Add unit to dirty_log_test
From: Sean Christopherson <seanjc@google.com>
To: Wu Fei <atwufei@163.com>
Cc: wu.fei9@sanechips.com.cn, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, anup@brainfault.org, 
	atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, pbonzini@redhat.com, shuah@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_062507_370941_2212A5FB 
X-CRM114-Status: GOOD (  17.59  )
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

On Mon, May 18, 2026, Wu Fei wrote:
> On 5/15/26 21:51, Sean Christopherson wrote:
> > On Wed, May 13, 2026, Wu Fei wrote:
> > > On 5/13/26 08:03, Sean Christopherson wrote:
> > > > On Mon, May 11, 2026, wu.fei9@sanechips.com.cn wrote:
> > > > > 
> > > > > Unit is introduced to replace the default 1ms if specified in command
> > > > > line. The following test can't trigger failure on my riscv vm:
> > > > 
> > > > Failure of what?  And does the failure really not reproduce with a higher interval?
> > > 
> > > On riscv, it fails to write protect some pages with valid page table entry
> > > then loses track of dirty pages. Higher interval doesn't help because only
> > > the first usleep matters, after the first collect_dirty_pages, all dirty
> > > pages are tracked precisely then there is no such problem.
> > 
> > Ah, gotcha.  Rather than let (and force) the user to provide a larger sleep time,
> > what if we instead randomize the delay before the initial reaping of the dirty
> > bitmap/ring?  That should provide a good balance between coverage, complexity and
> > user-friendliness.
> 
> I'm fine with your solution, I applied it and it did trigger the same issue.

Awesome!  I'll post a patch today.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
