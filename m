Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DF1E77188
	for <kvm-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 01:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6l8FWgYd8JcElPcN1YaTaghkrtKu45SvTzTSsdQ1CM8=; b=f7XwoGcJvwu5RgG2Okt3i/oyIc
	I13Ruuor0xT/3AyTOs4yI0H5FfFQid3MLCcPH9w5+S3w8+cAtYrOr5fMVdIA2C3kACcFw84+ezZfK
	GH+5uGCLc3ZceefMRM/uJFWnSITAq98qo8VAKhCX+1NWPJy7WegRJCmiSvJUQdh314XzO0YSn/kSz
	qIlWqURKtiOuAhE4a+DYQyGKpMOAmSAq3yb25xEmyR9ODVlUTPOZscuiv0DGuu1+ITWRcSEJXhSP4
	h97h8FkE8+nGjmvmgS7vyMiiZEAFTABgL9dBrGDfcgToDNz/FlxepzLIXXFLtlVTUPyB5ATyXawwQ
	qE4Rxd8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXrlQ-0000000AFiL-2R0M;
	Wed, 15 Jan 2025 01:00:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXrj5-0000000AFHM-23wv;
	Wed, 15 Jan 2025 00:57:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:Content-Type:
	Date:Sender:Reply-To:Content-ID:Content-Description;
	bh=8c5G4NuASNEHfaEA9NDCeW64qXXCEIHPTCDJus6cTIk=; b=eeO4OU8U8k4auUuvVySl01g6Mm
	KkyPHLSNEjlmeHbVNDCWFED+GLiwLljwyFCuV4utGXrNVGXUYE3BofSu6HdEhsivCg47xSg4admQy
	s+j8imAbcNNP6+f0jHQSAFHdFE1OESoQDZZGuwQhKFXnhM7HmMJvELFGz35TVQQYC+BY9M9MjRepR
	mzohFg9ZJcMSd44P7beUm1MmM3zdDzpZ+kgKyUAIeWPC3Hu1nJb+TsC67KKHfCBJEUMeqrn0q+Dva
	XiCaNBrSgz82PDRgKN3AnzGyY/nS/sC6Dae4M/tH5HHlnCZwZM/gNN+5QpwnkKY1GWCzu8H2TfhfR
	oFdZWTqg==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXrj1-0000000AioC-3o44;
	Wed, 15 Jan 2025 00:57:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B6AE25C5933;
	Wed, 15 Jan 2025 00:56:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC13EC4CEE6;
	Wed, 15 Jan 2025 00:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736902655;
	bh=l+9twYi0Uwgk+vxDb18woIEDFmtH67VIxPOkzuSyE9I=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=rFiEz9sdhNL1vEEfFmlCwjSPfCJhRy58Tc5CsvZ05oGqRKI6H+gGqCXvMFxcwcYZg
	 wQvdQgnB4miB73msApRp2XtVaIaznh/qWrPzZ30oWn8usbxBva2Y3t6cIUDkUxtT7u
	 65qG2n2zNlS1V92zM5bQlfH1dMSY513GmD1wxhNPs6GRfmgT4SUl3Eu5/FO+Vgwu5W
	 6CdBe8WoS53Q6akeOV6W3AArLH8y3iPvf5vp9NNQTdXpZM4/aSxoxvvARE+OJ4t8eM
	 cWUAGlUtsX8m8POXWpXpKNlL0h4bn2zhxixyMxVeHzUsElPzgyuhpEqiojgv97JHLZ
	 ZMD5n7EiLgGtA==
Date: Tue, 14 Jan 2025 18:57:33 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Peter Zijlstra <peterz@infradead.org>, 
 Mark Rutland <mark.rutland@arm.com>, linux-riscv@lists.infradead.org, 
 weilin.wang@intel.com, Will Deacon <will@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Ingo Molnar <mingo@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Ian Rogers <irogers@google.com>, linux-perf-users@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Atish Patra <atishp@atishpatra.org>, 
 kvm@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 kvm-riscv@lists.infradead.org
To: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <20250114-counter_delegation-v2-10-8ba74cdb851b@rivosinc.com>
References: <20250114-counter_delegation-v2-0-8ba74cdb851b@rivosinc.com>
 <20250114-counter_delegation-v2-10-8ba74cdb851b@rivosinc.com>
Message-Id: <173690265103.2069740.11443232308035656965.robh@kernel.org>
Subject: Re: [PATCH v2 10/21] dt-bindings: riscv: add Smcntrpmf ISA
 extension description
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_005740_272225_6A649379 
X-CRM114-Status: GOOD (  10.92  )
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


On Tue, 14 Jan 2025 14:57:35 -0800, Atish Patra wrote:
> Add the description for Smcntrpmf ISA extension
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250114-counter_delegation-v2-10-8ba74cdb851b@rivosinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
