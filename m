Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488AECF34D3
	for <kvm-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 15:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=48wP2Fy6nxLpyGCkLMIyH4gYPhZ8NELb+KuqJVVxANc=; b=jiUtBXc5bXQuv1
	I7jL9FXUz845S9VNLjhY8SFQ9kvCosPcqeKJ5SKmcO7xpWh/KeuA29Bkc+a9wnreP+OWqzGahceLm
	+xDt5NSKpOjL8u6itsUIAob3jX58/1WCUH+/gi+EsrEmfo95kJ2AMA1u1BI1a8xWBY+KRQXJGs4ml
	s/Hj0lLW+WcrHC09LF1opAungaEOywvGNwDzBi0lEdKDbDzMI9s93Xp8x8jQL80lrrw8YH3EZ3rcr
	Utj9fNCH7hAjRM8arv7/81BeGw0CUGf4lUtR604pHLK9Hil+0/qwihB24l03C83nj2zCT0bMSiSAE
	U9gX2p2peZBxSTXb6wuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkK4-00000003VUF-2poI;
	Wed, 19 Nov 2025 15:42:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkK3-00000003VTi-08aD;
	Wed, 19 Nov 2025 15:42:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 37A9743C48;
	Wed, 19 Nov 2025 15:42:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4975C2BC86;
	Wed, 19 Nov 2025 15:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763566937;
	bh=ytrC31SzVFXSnjTf0qvd0BBEtuw54RVFHossnCqW1pQ=;
	h=Date:From:List-Id:To:cc:Subject:In-Reply-To:References:From;
	b=Uq6ah7BbsL8XTJVVvRb0IDaOFYwVVETuv23G/zI21sj6VxKv0YJtaoTm4xkLzT+JK
	 qjFtNQClKB7k/bsxYg2/s0WnT0Xw/IUGVv5KSfKO/Zv9mqGhv/qKcRdsOcUZ9qBJ7I
	 WZPUqEfYQp+1zgswQOSKGKbg4p2zxBEmW4AQpspD5ObiKYkYoxfbtdkjGQcsEYJ3Jd
	 US5VHWXpSp6nbFvS5VBM4AfYNhEyPPqwGYK95gSSkKGK3ukZXF4yTgRT4IixEKHbPa
	 qRMveG6I2pvHJd0KqcOyYGDBEPM/fF673TI4EO06uVW/6WN38ywOW0b+T08MGDztIc
	 Z/RKzOsFjkCPQ==
Date: Wed, 19 Nov 2025 08:42:09 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: patchwork-bot+linux-riscv@kernel.org
cc: Xu Lu <luxu.kernel@bytedance.com>, linux-riscv@lists.infradead.org, 
    corbet@lwn.net, paul.walmsley@sifive.com, palmer@dabbelt.com, 
    aou@eecs.berkeley.edu, alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org, 
    conor+dt@kernel.org, will@kernel.org, peterz@infradead.org, 
    boqun.feng@gmail.com, mark.rutland@arm.com, anup@brainfault.org, 
    atish.patra@linux.dev, pbonzini@redhat.com, shuah@kernel.org, 
    parri.andrea@gmail.com, ajones@ventanamicro.com, brs@rivosinc.com, 
    guoren@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
    devicetree@vger.kernel.org, kvm@vger.kernel.org, 
    kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
    apw@canonical.com, joe@perches.com, lukas.bulwahn@gmail.com
Subject: Re: [PATCH v4 00/10] riscv: Add Zalasr ISA extension support
In-Reply-To: <176355541475.758643.7685467502830246491.git-patchwork-notify@kernel.org>
Message-ID: <b7dc669e-cc48-f163-0146-0ef37dbd19ec@kernel.org>
References: <20251020042056.30283-1-luxu.kernel@bytedance.com> <176355541475.758643.7685467502830246491.git-patchwork-notify@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074219_112266_E3BF49FE 
X-CRM114-Status: GOOD (  15.51  )
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

Folks,

On Wed, 19 Nov 2025, patchwork-bot+linux-riscv@kernel.org wrote:

> This series was applied to riscv/linux.git (for-next)
> by Paul Walmsley <pjw@kernel.org>:

This actually isn't true; I've only applied the first four patches (see 
below).

> On Mon, 20 Oct 2025 12:20:46 +0800 you wrote:
> > This patch adds support for the Zalasr ISA extension, which supplies the
> > real load acquire/store release instructions.
> > 
> > The specification can be found here:
> > https://github.com/riscv/riscv-zalasr/blob/main/chapter2.adoc
> > 
> > This patch seires has been tested with ltp on Qemu with Brensan's zalasr
> > support patch[1].
> > 
> > [...]
> 
> Here is the summary with links:
>   - [v4,01/10] riscv: Add ISA extension parsing for Zalasr
>     https://git.kernel.org/riscv/c/0597b9c8627e
>   - [v4,02/10] dt-bindings: riscv: Add Zalasr ISA extension description
>     https://git.kernel.org/riscv/c/6e2a0ff70abe
>   - [v4,03/10] riscv: hwprobe: Export Zalasr extension
>     https://git.kernel.org/riscv/c/d5e20628a882
>   - [v4,04/10] riscv: Introduce Zalasr instructions
>     https://git.kernel.org/riscv/c/c4139ea6717c
>   - [v4,05/10] riscv: Apply Zalasr to smp_load_acquire/smp_store_release
>     (no matching commit)
>   - [v4,06/10] riscv: Apply acquire/release semantics to arch_xchg/arch_cmpxchg operations
>     (no matching commit)
>   - [v4,07/10] riscv: Apply acquire/release semantics to arch_atomic operations
>     (no matching commit)
>   - [v4,08/10] riscv: Remove arch specific __atomic_acquire/release_fence
>     (no matching commit)
>   - [v4,09/10] RISC-V: KVM: Allow Zalasr extensions for Guest/VM
>     (no matching commit)
>   - [v4,10/10] RISC-V: KVM: selftests: Add Zalasr extensions to get-reg-list test
>     (no matching commit)

In terms of patches 5-8, we're still waiting for Xu Lu to update the 
patches based on Andrea's feedback.  Xu Lu, are you still planning to 
update these?


- Paul

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
