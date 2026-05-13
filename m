Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF07CD4F21
	for <kvm-riscv@archiver.kernel.org>; Wed, 13 May 2026 00:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vuhz+3ZlakaX6i8pwYxZw3tmCQA6uNZASWMa3jAypwc=; b=rEshfNxVa9YUb29fQsSONzpnA9
	qTGZ6jCsA10e7srNaa3rWimUvyqoUmbFSoAcDTmhoniNj+lHaPfXVgtlLDIIOKfIKJFrol0DrMRTj
	QK4N8IqwlxAtCVegXQt+9HuFiAKomVjSblv0mtBTYOKyx2uunE2zaXBNYUtDVeROvckQ7800TisG1
	DGIuW00cDpheJ78Qonc1eVXPVRQLlZDBbeGCTwirlgVfP2yzPCCjynnvEf0LniWSuh/CPudAvI91U
	YU0h7ssdTlcC9Y2rRXyN84gl1j92oUdb2CPqrkvvp8DN015edw4Gpx58TnXB2FtqSPaexX1AfWUvU
	/4T2FcEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMx4Y-00000000kSS-476S;
	Wed, 13 May 2026 00:03:34 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMx4V-00000000kRI-3hJk
	for kvm-riscv@lists.infradead.org;
	Wed, 13 May 2026 00:03:33 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2b4678c6171so63403345ad.1
        for <kvm-riscv@lists.infradead.org>; Tue, 12 May 2026 17:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778630610; x=1779235410; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DwPr9KzMTwvYnVjMUfpiwh1INt0dAKct26Q2oFZfRtE=;
        b=qDwY+sa4lQYK1dmMI2vJcSLA7ulITV7JH8GjOCiWnr16mgEerPRIl1pJccV0MWs3PH
         vyagQ5H1JidR5oyoess+8nlnKi7eo+9+8SLacXiSxPPvMiY4k+SN06qoK4gMBcyaPniy
         DeeVQSFKccEq/XxXCp8bX9Vj5gWoHthG0BsPPMEcIdwQ2BZYads+TrLKgur6lRJv+wjG
         U3BdnGchEIt8v69s91fvjdwbAi0FyzTxNqI66uWlOsYMLBqSmTMKRbTHaLN21CSAS610
         M7/xWilE24s0ztgU8TuYcZ1JSj1Plns+riFTcpMuKA6198JUWqTr8MaqcG87d9rw57ak
         sWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778630610; x=1779235410;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DwPr9KzMTwvYnVjMUfpiwh1INt0dAKct26Q2oFZfRtE=;
        b=g7WP1EEfGUZknF0Zda7cQftUbg8MaDUZDUzvzEPiacAl3Eh7HfCcqUS4I8h39Ag+ax
         du8QuXqfsRPV1heh2KfGhuzbTq3Ik7+HOjrr6npJVD+aG4TVyFw8rSFZrTDZWzHYgVL9
         6oLOPyvryJ8r0IVnLmJ3IW2kn/L8u6v/81NK1p7NsaZtOl/D1Q/+TnbHLYoO32+/hKDi
         588V2v8eKprq7RdZS+7S/qgCBxcZlk+EbQV6+C126nw2NWKMxooXKoAh7mmte+XQtLAC
         kwyGBMgJAhX4NxqcMiqDuGCAOw71axkRR77oTO635H6612xbj3BvMnNf2ae3cGXYu8XA
         qUew==
X-Forwarded-Encrypted: i=1; AFNElJ/eEnlzpzT40jTwG6bDkwNQfR3TNtAb8fDgBGw0ttDUyU34xPZY1yfhLaIzQPMe1FW6s9yKDOgEH78=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7z3zwhGSaQPpCcV/XS7mC9Ba8xHiCGxVRrRG3N9Pt/R7LjjBi
	ax4G5s+kfXEpXhJYyZRAXnzhCZ/4T0Ov3JBdOrO2/OurcH6wXlQYRygWorWZJ9aqqDNwc3l2fPO
	T/XbbGw==
X-Received: from plhs10.prod.google.com ([2002:a17:903:320a:b0:2bc:bb08:92dc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3b8f:b0:2b4:5cb8:99eb
 with SMTP id d9443c01a7336-2bd276d98d1mr11087365ad.27.1778630609922; Tue, 12
 May 2026 17:03:29 -0700 (PDT)
Date: Tue, 12 May 2026 17:03:29 -0700
In-Reply-To: <202605111130.64BBUXDN013040@mse-fl2.zte.com.cn>
Mime-Version: 1.0
References: <202605111849442561v1a0B_7W1L2Z-ENusLaP@zte.com.cn> <202605111130.64BBUXDN013040@mse-fl2.zte.com.cn>
Message-ID: <agO_0ejKd0x38_-E@google.com>
Subject: Re: [PATCH 1/3] KVM: selftests: Add unit to dirty_log_test
From: Sean Christopherson <seanjc@google.com>
To: wu.fei9@sanechips.com.cn
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, anup@brainfault.org, atish.patra@linux.dev, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	pbonzini@redhat.com, shuah@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_170331_923614_F49ED85E 
X-CRM114-Status: GOOD (  11.91  )
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

On Mon, May 11, 2026, wu.fei9@sanechips.com.cn wrote:
> Currently dirty_log_test hardcodes usleep 1ms in each interval, which
> could be too short for guest to write and fault in enough pages, then
> there is less chance to test the write protection mechanism, especially
> in the case of (log_mode != LOG_MODE_DIRTY_RING).

But when log_mode != LOG_MODE_DIRTY_RING, the individual sleep time is largely
meaningless, because the test won't reap the bitmaps for iterations > 0.

			if (i && host_log_mode != LOG_MODE_DIRTY_RING)
				continue;

>
> Unit is introduced to replace the default 1ms if specified in command
> line. The following test can't trigger failure on my riscv vm:

Failure of what?  And does the failure really not reproduce with a higher interval?

> 
>   # ./dirty_log_test -m 21 -M clear-log
> 
> By enlarging unit, it fails every time:

"unit" is way too vague.   Even looking at the code, it's not clear to me what
you intended a "unit" to be.  I'm not entirely opposed to providing the user with
more control over the innards of the test, but the interface needs to be somewhat
intuitive.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
