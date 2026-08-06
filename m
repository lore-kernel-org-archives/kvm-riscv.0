Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B14C561E6
	for <kvm-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 08:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VPiWIkbVWmYBHHiyLJucgdQjS8LA0v60xAbLS4L6UhA=; b=u7MuQkq9ahEc71
	yB7gdPbu+pkTq1YWV1wVbhk7BHZFMFI41j3XsvlxVQK/Uy8+Ur+fE4/0HlVBK/ujR5mWhlPa2ZCqj
	OWsvJuaQcXrTvJ5v+4HbzSW0uenJM81XoGTBTRNfyZOiISs86NCjnUbllf5OllIwZ8NFFUxnnXQHj
	4U6trH7SwzTdfarR+5QNXXoXLroEw5hY+yt5hoAL+Y4DzpgsWnL06yxiXmIPVwsbtn1tI22+LkYTd
	2dmb0DlwZZnmGsgv5xKes0UoI9HmrOp0VQe9kpOQs5yb9+kJLkqqMQUpUJN45Ud23HOYfknCMTl6f
	JXdk2buvPRiVzmSCiuhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtUZ-00000005Eww-3ODZ;
	Thu, 06 Aug 2026 08:30:19 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtUX-00000005EwH-35MR;
	Thu, 06 Aug 2026 08:30:18 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1786005015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RYCqiASa8LvYt/XQP0Uqmi0xvt/HI/PjhI8z3teOwyg=;
	b=N4ulFANk+Jf6IV7bn8P/eqhssX+kCl9QEn40O1M3GjqNka2J4jp/JZAC0BdQGhtpcvadZn
	sOFZtuGdMFxu6wT1XbHWBQ7jtMH6+pBdEitxTFvSGH7Hm0KyahyZ01DRcNfXYP7T+XS4n2
	WFNwz6RYniSyD1qnI8ihnblcn6S6vR+pwUcleFVJ7SU9yXVO53VOVxADgbcRiSHYTHUzut
	jAdy77QG8XrLwWvjWvgspfuPJvt80DINXy8lKvCVuFMOsUp01TnvJpUQSoqCsquNtMM1pd
	U75a+Wgz8FQQqonbuMXZf/bI0PfOb7zAsFEdXpBM6bCQn3s5XosZvcEw78BRaQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1786005015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RYCqiASa8LvYt/XQP0Uqmi0xvt/HI/PjhI8z3teOwyg=;
	b=df+jiy/uQp2/4IBaxPt0UnDSaG6JqQTpGXMEyQpQKYox9a1aUE82jy0N/pi/hhSFmVwMTW
	WPYXSr83aZxpICAA==
To: Charlie Jenkins <thecharlesjenkins@gmail.com>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti
 <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Atish Patra
 <atish.patra@linux.dev>, Conor Dooley <conor@kernel.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Shuah
 Khan <shuah@kernel.org>, Radim =?utf-8?B?S3LEjW3DocWZ?=
 <radim.krcmar@oss.qualcomm.com>,
 Jesse Taube <jtaubepe@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Charlie Jenkins
 <thecharlesjenkins@gmail.com>
Subject: Re: [PATCH v3 05/17] riscv: kprobes: Use generated instruction headers
In-Reply-To: <20260707-riscv_insn_table-v3-5-3f8e5f75ba97@gmail.com>
References: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
 <20260707-riscv_insn_table-v3-5-3f8e5f75ba97@gmail.com>
Date: Thu, 06 Aug 2026 10:30:15 +0200
Message-ID: <87ik5nd52g.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_013017_916387_16F88312 
X-CRM114-Status: UNSURE (   4.20  )
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

Charlie Jenkins <thecharlesjenkins@gmail.com> writes:

> Migrate the code that is decoding instruction for the use of kprobes to
> use the generated instruction headers instead of the hand-written
> instruction functions.
>
> With the more granular instruction support, split the decoding of branches into
> their own functions.
>
> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

Reviewed-by: Nam Cao <namcao@linutronix.de>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
