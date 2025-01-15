Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3D5E77188
	for <kvm-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 00:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Ji6T15LPSh1RsXaBeBEv/nC8W4/fSeUUzVHYiYR6GQE=; b=VtpsCnyfGGg1Byq6/l6l2NRz6z
	vi8POV9R2ZvHexmOxizYr/Kd2LdFDTx874clE/aH1LTyin5TEUeVi5SUgukukHAeIVuNoN3gXsQqK
	qWArUg2A3G0XM9ZzizW3i7ytq2YsaNTAE0fjklV3kysFF2uQetPEoNAMYc9aYDm3PBUrn7GkUUrvJ
	OpLvcy1HMc+tSyv3waIOi57Z4gMd+n6xAdhoSVSKa803i+CXgS2RgbfojVJyQnH/LBWHbc1wlGCQi
	Qqbb5o32FRf0PWIg/ao+qZuIpmMlp/mrUXxWSmRthNc0wc79eXRyBj6njqk+WvsE2z4Az0/KPm/BF
	wE9Gwr3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXrkC-0000000AFX5-0M3c;
	Wed, 15 Jan 2025 00:58:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXriw-0000000AFEM-2cRx;
	Wed, 15 Jan 2025 00:57:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 18C675C5705;
	Wed, 15 Jan 2025 00:56:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64D69C4CEDD;
	Wed, 15 Jan 2025 00:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736902653;
	bh=E5F1TruT3qFWIpE0gZRapnmjQqlLtDzwzVIONB+NJTE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=E8ZC0HYh+oK/S/g901Rmeb7kofhXSeYcTgsyYLyVs01V883b8eg+oCadnzsZvyeHp
	 BBbx2G2QIX9txI1ZtB+hGYcFwvr/WDeGaNyPWrvJyOOo/YH2pRBGt43opN+oZ8yq1U
	 qwx2J0scKU3mRlexxp5YzcFLMdMW5EtJKiVAc1ZM8kXrKNOeFmm7A4uGUgIobo4SZX
	 ikraH3oUGbksFIpGx2qcBZ8cX59cEqLtYtIR2r/FABlpSbkEp1WBX0B/MjAEi6snUx
	 YJv4kW7KwjO99j2P0HfBeK9q6LRNZU0Y/NJRo/nc2CXdPxEFtRIYEVHwcSTQoQUFHx
	 fWa8rEKKXtaog==
Date: Tue, 14 Jan 2025 18:57:32 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Palmer Dabbelt <palmer@sifive.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
 linux-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>, 
 Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, 
 Ingo Molnar <mingo@redhat.com>, kvm-riscv@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, weilin.wang@intel.com, 
 Conor Dooley <conor@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, kvm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 linux-kernel@vger.kernel.org
To: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <20250114-counter_delegation-v2-8-8ba74cdb851b@rivosinc.com>
References: <20250114-counter_delegation-v2-0-8ba74cdb851b@rivosinc.com>
 <20250114-counter_delegation-v2-8-8ba74cdb851b@rivosinc.com>
Message-Id: <173690251211.2066548.13200770896119335906.robh@kernel.org>
Subject: Re: [PATCH v2 08/21] dt-bindings: riscv: add Ssccfg ISA extension
 description
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_165734_705484_E4AA1EC5 
X-CRM114-Status: GOOD (  10.91  )
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


On Tue, 14 Jan 2025 14:57:33 -0800, Atish Patra wrote:
> Add description for the Ssccfg extension.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/riscv/extensions.yaml:131:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/riscv/extensions.yaml:131:1: found character '\t' that cannot start any token
Documentation/devicetree/bindings/riscv/extensions.yaml:131:1: found character '\t' that cannot start any token

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250114-counter_delegation-v2-8-8ba74cdb851b@rivosinc.com

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
