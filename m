Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C48C55ABF
	for <kvm-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 08:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W8ey4FfTWM0e8JdG1GEX7P7StNJNyOKgetu++ateksY=; b=eR8OkzgkirYsEh
	KmOyWMfUye+c4zzcoHsKXD46o526hb7S5xw+zYpp5RTCi1E02JpLUoxO+xQHrXj/4IpFQLN15MxzJ
	5+uwd/UQZs1uMx5ncF79KSl0gSPoBP0/TwDE1aRZyrac6XD2c4bU+Q2JPpDyuFaDZbyP7WQ3RR7sm
	BY1PPuaxDzekrt9Rz+pl7dpjlSjvUtFx7ABEbmLzlDTxuLlab7MTXOJZ8ZkHPh0iRpttAIvGBh5nd
	n5HOjWIbggMTSporSgXSPrdKcFFgPpUgMEh3h6ORmGyeFfLh4/jI5UMlCuzeMBW+y5jjOe8JlHY0T
	BRxw72qPwKv05KcVkuKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtUx-00000005F32-07kB;
	Thu, 06 Aug 2026 08:30:43 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtUu-00000005F1g-1Kge;
	Thu, 06 Aug 2026 08:30:41 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1786005038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tZf7xKKc+1d2MNQgkLvIjW8ujEjid1DyCjtobMNJ3tM=;
	b=3U+sDmtsKA+gIobhreS8X5tZMGQYfmuSSZS4qPnpbkB12L0+Q3YwHunpfZzVLtSTHcdcNw
	KfJ8EABF/J+YRK8Cn6tP73xzTRSFvvT9kALj8HH5CSFMGnEXfZOGx4KAZZYLLMD4jPGvTI
	RYpCZwU8sqymXkEx1lXTGSd30O+M0LkB0lE3Sj2dCuQGfh2RByjotBPRF/nUi3D7SYq+KB
	M6tNTsZ0RPQ3Ie7pMYkyaYCI92qPAoq3stLeXEy3ilNNAk0J6/+EHtxl7XI4k5np7JKGpn
	UWLAlnXZH6XVL0jJZAJAuMuNB+i0++CK4BhRWVQ9xNTI5QWvI5rjt7u6G4LTNA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1786005038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tZf7xKKc+1d2MNQgkLvIjW8ujEjid1DyCjtobMNJ3tM=;
	b=7o8EsxQcewlMoX0tfcRt/S/CFJgOsMEMUZCKY2z4IwAgXrtmyS+s+DlSYK9o+PaWyj0g+3
	Dx3nZz0cNTv/iSAQ==
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
Subject: Re: [PATCH v3 06/17] riscv: cfi: Use generated instruction headers
In-Reply-To: <20260707-riscv_insn_table-v3-6-3f8e5f75ba97@gmail.com>
References: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
 <20260707-riscv_insn_table-v3-6-3f8e5f75ba97@gmail.com>
Date: Thu, 06 Aug 2026 10:30:37 +0200
Message-ID: <87fr0rd51u.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_013040_496294_52B780B5 
X-CRM114-Status: UNSURE (   3.16  )
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

> Migrate the code that is decoding cfi instructions to use the generated
> instruction headers.
>
> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

Reviewed-by: Nam Cao <namcao@linutronix.de>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
