Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39870CD8CB2
	for <kvm-riscv@archiver.kernel.org>; Wed, 10 Jun 2026 15:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bFx8VxpwE9+SbwXpZNDEtHYdKQ0xJGVria/Go48E7aA=; b=AEht+RdUqul0XH
	I2YIe2kyhkPc6hAsxVFg1gMqB8noLjlRd0lLt5kQQhdWCET0+4t3hbwq+aG4HdfH+fYxjLiqhiQVT
	CCdnVsuyVl8WHY2V6NQ/b2PSao2SJGs2nuVVLTmcS8Z98MVQ9cT7Wcuc+07VGk3Y4QTTkp6YaYqFA
	jCBp5D9i+FcgFmetJZS5zNnV5z2nf71O/AoVCKRpURgdQAMi2WIhUt7Whc0Ra0ylZbYzEgc5Csjyg
	xHOKzby3v5AyIZ15UJw/Xr4a9BGn9UMoJ223Q6eHO0KzaUQFWFx9yf5n3GxO6C/TbTBdjvjrZUC3A
	ANArThtDpMz2LrSbeisQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXLIC-000000084Un-035I;
	Wed, 10 Jun 2026 15:56:36 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXLI8-000000084UF-0fZC;
	Wed, 10 Jun 2026 15:56:33 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781106986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=msjhwjsuJi/htIU80DZBT36GfATEuBVhKi4XiG52gs8=;
	b=Evzdm+SMUac0KWBp/cSjFK4ibPrgnP+r5mKRPgQnPivfV4ERX9NRAyOQ5yu543SPvXmg5h
	yJAtK1t0KzFg+b8Uv9bz/Whm8ORmqCXerfUfGAoBvEOHHqpG1ZjMl/DVGIWUUgw3ehKjA8
	YEuA5NKVOeL7SEE3qt2+QH/88E7UkZ1cxv4/gt82Sr8lUYPK5RaqDIpz/AnAQJNjdr6dz0
	b79Kc4fVb6yQFzfE4F37jsmNrWmbm3yNKG89hEqFJNpAAoPhDfGnPl47moLlUPZpX2sgTO
	ZX02s59l5CieC6vsqboDL1jvp/5At+Yu0wlxI5s1r6RrDBUdXrTe4621WGAIJQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781106986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=msjhwjsuJi/htIU80DZBT36GfATEuBVhKi4XiG52gs8=;
	b=HzG5JS6iQRXS2PQdNGQVgSzLFt0ZH82WyaHCRre7c3gkPL0HlgAN+iMasP7WUDwalbAl1s
	ZM7DaVfLKgoCAYBg==
To: Charlie Jenkins via B4 Relay
 <devnull+thecharlesjenkins.gmail.com@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti
 <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Atish Patra
 <atish.patra@linux.dev>, Conor Dooley <conor@kernel.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Shuah
 Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Charlie Jenkins
 <thecharlesjenkins@gmail.com>
Subject: Re: [PATCH 01/16] riscv: Introduce instruction table generation
In-Reply-To: <20260407-riscv_insn_table-v1-1-54b4736a1e77@gmail.com>
References: <20260407-riscv_insn_table-v1-0-54b4736a1e77@gmail.com>
 <20260407-riscv_insn_table-v1-1-54b4736a1e77@gmail.com>
Date: Wed, 10 Jun 2026 17:56:25 +0200
Message-ID: <878q8m1j9y.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_085632_363961_4942D388 
X-CRM114-Status: GOOD (  13.10  )
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

Charlie Jenkins via B4 Relay
<devnull+thecharlesjenkins.gmail.com@kernel.org> writes:
> From: Charlie Jenkins <thecharlesjenkins@gmail.com>
>
> Eliminate the need to hand-write riscv instructions by using a shell
> script to autogenerate a header from an instruction table. This is modeled
> after the syscall table infrastructure.
>
> The table is generated externally by riscv-unified-db [1], but is
> in a simple format to make it possible to use other tools or modify
> manually.
>
> [1] https://github.com/riscv-software-src/riscv-unified-db
>
> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

Thanks for the work, I really like the idea. This will make it much
easier to maintain the instruction stuffs.

> +c.ld common,32 011<13|00<0 imm<3=6-5|12-10 xd!1!3!5!7=4-2 xs1=9-7
> +c.ld common,64 011<13|00<0 imm<3=6-5|12-10 xd=4-2 xs1=9-7

Not sure if I confuse something, but the spec says "C.LD is an
RV64C-only instruction". Why do we have 32 here?

> +echo "#define COMMA ," >> $outfile
> +echo "#define SEMICOLON ;" >> $outfile
> +echo "#define SINGLE_ARG(...) __VA_ARGS__" >> $outfile

Aren't these macro unused?

> +echo >> $outfile
> +
> +grep -E "^[a-z\.0-9]+[[:space:]]+" "$infile" | {
> +    while read name base fixed variables; do
> +        echo "/* $name */"
> +
> +        compressed_name=${name##c.*}
	   ^^^^^^^^^^^^^^^
	   this name is misleading

> +        invalid_inst_functions=""
> +        variable_params=""
> +        constraints=""
> +        match=""
> +        mask=""
> +        make=""
> +
> +        # All compressed instructions start with "c."
> +        size=${compressed_name:+32};
> +        size=${size:-16};
> +
> +        # Replace all . with _
> +        formatted_inst_name=$name
> +        while [ ! ${formatted_inst_name##*.*} ]; do
> +            prefix=${formatted_inst_name%.*}
> +            suffix=${formatted_inst_name##*.}
> +            contains_dot=${formatted_inst_name##*.*}
> +            formatted_inst_name=${contains_dot:-${prefix}_${suffix}}
> +        done

Does the simplier
     formatted_inst_name=$(echo $name | tr '.' '_')
work?

> +            echo "static __always_inline ${type}${size} riscv_insn_${formatted_inst_name}_extract_${variable_name}(u${size} ${insn})"
> +            echo "{"
> +            echo "\treturn ${extract};"
> +            echo "}"
> +            echo "static __always_inline void riscv_insn_${formatted_inst_name}_insert_${variable_name}(u${size} *${insn}, ${type}32 ${var})"
> +            echo "{"
> +            echo "\t*_insn &= ${insert_mask# & };"

Why is this required? Isn't this part always zero at this point?

> +            echo "\t*_insn |= ${insert# | };"
> +            echo "}"
> +
> +            if [ "${only_base}" ]; then
> +                invalid_inst_functions="${invalid_inst_functions}static __always_inline ${type}${size} riscv_insn_${formatted_inst_name}_extract_${variable_name}(u${size} ${insn}) {\n\tpanic(\"${name} is not supported on non ${only_base}-bit systems.\");\n}\n"

Instead of panic(), can we do BUILD_BUG() instead?

Nam

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
