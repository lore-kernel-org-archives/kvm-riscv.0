Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFA7E77197
	for <kvm-riscv@archiver.kernel.org>; Tue,  7 Jan 2025 17:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kB2e21NDoMEMViLOCfEYY2cylO6P8Yz9Bo3AmUsDdr8=; b=VNkJrHtYRjnOfC
	fSaF6NcRJ/EoaVcp8CbCuazEu7zwHMsRfyLDuHkpx/kmGmnQuBgAbhx5I9x5iac57gp+Tqt9KC/6w
	h0S6Y65l5blkqKQXaUulnchJ3aexQcigO1CzDrTKAe9GvbskCWCSDVnrV/FYG2TGQNghu88v8CbBg
	je5r6PmveecdY5V0FzHUEjmgETjVWjrE7GJAkZxTIZRgb8WGyxls462LZYRaMiwEZHfqKW8IyJ14e
	ZzxzZHTX907lLnQvhYXlHsVbTjmyR8jfg1fXJJdkbswOqh5/r2DF8OjEqjKbgMrRfhhBHtyKeNSYq
	82BMTqUM7UlX1FNvmN7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDV6-00000005skP-44z6;
	Tue, 07 Jan 2025 17:36:20 +0000
Received: from out-180.mta1.migadu.com ([2001:41d0:203:375::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDAE-00000005oAA-2gPk
	for kvm-riscv@lists.infradead.org;
	Tue, 07 Jan 2025 17:14:51 +0000
Date: Tue, 7 Jan 2025 18:14:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736270078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xg+dc2tTYCj5PN7khBUdbRLWSlxt/+MSQH3EPBE/qm0=;
	b=XeHWCDWqs8WXzxdf4zisWw6JDrnMqtXYQOuxWWXFC8chJ2gzoYPf5nKqVtUqf5+pNRg0L6
	zXmCKqMPlVVjsm3qAkSU75BvOL8GoWq4zJLZTPUVJOBwl970Kb+etIzOZpHhOWJMXaqSEa
	nlkQ9r0P8x7xo+JFXtLMyQMM9naZjHg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v4 1/5] kbuild: allow multiple asm-offsets
 file to be generated
Message-ID: <20250107-7e693ed9a487a4c6e714d071@orel>
References: <20241125162200.1630845-1-cleger@rivosinc.com>
 <20241125162200.1630845-2-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241125162200.1630845-2-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_091447_172444_171D5F6E 
X-CRM114-Status: GOOD (  10.87  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 25, 2024 at 05:21:50PM +0100, Cl=E9ment L=E9ger wrote:
> In order to allow multiple asm-offsets files to generated the include
> guard need to be different between these file. Add a asm_offset_name
> makefile macro to obtain an uppercase name matching the original asm
> offsets file.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  scripts/asm-offsets.mak | 22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)
> =

> diff --git a/scripts/asm-offsets.mak b/scripts/asm-offsets.mak
> index 7b64162d..a5fdbf5d 100644
> --- a/scripts/asm-offsets.mak
> +++ b/scripts/asm-offsets.mak
> @@ -15,10 +15,14 @@ define sed-y
>  	s:->::; p;}'
>  endef
>  =

> +define asm_offset_name
> +	$(shell echo $(notdir $(1)) | tr [:lower:]- [:upper:]_)
> +endef
> +
>  define make_asm_offsets
>  	(set -e; \
> -	 echo "#ifndef __ASM_OFFSETS_H__"; \
> -	 echo "#define __ASM_OFFSETS_H__"; \
> +	 echo "#ifndef __$(strip $(asm_offset_name))_H__"; \
> +	 echo "#define __$(strip $(asm_offset_name))_H__"; \
>  	 echo "/*"; \
>  	 echo " * Generated file. DO NOT MODIFY."; \
>  	 echo " *"; \
> @@ -29,12 +33,16 @@ define make_asm_offsets
>  	 echo "#endif" ) > $@
>  endef
>  =

> -$(asm-offsets:.h=3D.s): $(asm-offsets:.h=3D.c)
> -	$(CC) $(CFLAGS) -fverbose-asm -S -o $@ $<
> +define gen_asm_offsets_rules
> +$(1).s: $(1).c
> +	$(CC) $(CFLAGS) -fverbose-asm -S -o $$@ $$<
> +
> +$(1).h: $(1).s
> +	$$(call make_asm_offsets,$(1))
> +	cp -f $$@ lib/generated/
> +endef
>  =

> -$(asm-offsets): $(asm-offsets:.h=3D.s)
> -	$(call make_asm_offsets)
> -	cp -f $(asm-offsets) lib/generated/
> +$(foreach o,$(asm-offsets),$(eval $(call gen_asm_offsets_rules, $(o:.h=
=3D))))
>  =

>  OBJDIRS +=3D lib/generated
>  =

> -- =

> 2.45.2
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
