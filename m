Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1E4E77188
	for <kvm-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 02:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RjDEY1Sh42cuRGFzEhCWh/yBSLhFz2g4LudN8Fq+Yqw=; b=Lbdjk6VfIKvQneLW3N7cEEO1M9
	hMHptsKCUsYWSQRgncQcx0b4K3QJO1/RRgV+830OhLZBZ8TND4vJnuUcLUfLFrNrvDvnCggZqcDmQ
	kSJSuO2qy2ktFPe+B/1Z6SQZkk+Ee7+zit0pHth5zFhzw8qGg3meDXCermMBlP6YN74dMz71VCmH/
	ExVdcfvRwBFwnkWJXIPiNt0phEWhhcoWzN3CvlhZEhca+WzPbVZ9gxq5/lqgNcQK9YqBjswAy7tw2
	9VbS3RhM/9r8lJYOX3oFs1xq9Oy6244dPCCExMW3PbVyWHj7QluGHcADmUAj1vrcbb7NaUhxhAgzc
	fzFbST2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXsjm-0000000AMlS-1kIk;
	Wed, 15 Jan 2025 02:02:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXriv-0000000AFE3-10o8;
	Wed, 15 Jan 2025 00:57:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B7DE65C4877;
	Wed, 15 Jan 2025 00:56:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9063C4CEDD;
	Wed, 15 Jan 2025 00:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736902652;
	bh=KGGNDzoaWvSUYYvzmYVu6FGehnU8B6otZzhgT9PcGl0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=dfybK6JS3Et6WBGW9KdBFspT/KTVKi3djXQeQQ+vCsdquH0oxKA8TAiL2RBIHBQy3
	 qmvwqwUtlrFqOqAZDdiPT08X8XYi1ie6B4A7FIYnMtKbn66rkP4YHX3YrZuBmpTwyW
	 kvsPO6uwsv8Z6jpY2ht9krItPCPlEyVN2TaI0fTtoUtwKXGnZ0fXTP8dMxFQgZxigQ
	 09hHjXAJqFq/BF4e/FVLDH8UXVwJwOVHlMgiMFPsTr+YPtae310NzwKabz2CeZyAoF
	 Bd+CQUnkbufQIIAnLutb7IzJOpl4UK04alZfDJlsCw0seeI1zn2TfhBlDGH+CDEXu1
	 9Pi4ObO/0FpRw==
Date: Tue, 14 Jan 2025 18:57:31 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 linux-arm-kernel@lists.infradead.org, Anup Patel <anup@brainfault.org>, 
 Will Deacon <will@kernel.org>, weilin.wang@intel.com, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, kvm-riscv@lists.infradead.org, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, kvm@vger.kernel.org, 
 Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Namhyung Kim <namhyung@kernel.org>, Palmer Dabbelt <palmer@sifive.com>, 
 linux-perf-users@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 Ingo Molnar <mingo@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Ian Rogers <irogers@google.com>
To: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <20250114-counter_delegation-v2-4-8ba74cdb851b@rivosinc.com>
References: <20250114-counter_delegation-v2-0-8ba74cdb851b@rivosinc.com>
 <20250114-counter_delegation-v2-4-8ba74cdb851b@rivosinc.com>
Message-Id: <173690237126.2063459.986002304235117552.robh@kernel.org>
Subject: Re: [PATCH v2 04/21] dt-bindings: riscv: add Sxcsrind ISA
 extension description
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_165733_373910_4DF85801 
X-CRM114-Status: GOOD (  11.47  )
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


On Tue, 14 Jan 2025 14:57:29 -0800, Atish Patra wrote:
> Add the S[m|s]csrind ISA extension description.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/riscv/extensions.yaml:149:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/riscv/extensions.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/riscv/extensions.yaml:149:1: found character '\t' that cannot start any token
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@0: False schema does not allow {'device_type': ['cpu'], 'compatible': ['riscv'], 'reg': [[0]], 'riscv,isa': ['rv64imafdc'], 'mmu-type': ['riscv,sv48'], 'cpu-idle-states': [[13], [14], [15], [16]], 'interrupt-controller': {'#interrupt-cells': 1, 'compatible': ['riscv,cpu-intc'], 'interrupt-controller': True}, '$nodename': ['cpu@0']}
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@0: Unevaluated properties are not allowed ('riscv,isa' was unexpected)
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@1: False schema does not allow {'device_type': ['cpu'], 'compatible': ['riscv'], 'reg': [[1]], 'riscv,isa': ['rv64imafdc'], 'mmu-type': ['riscv,sv48'], 'cpu-idle-states': [[13], [14], [15], [16]], 'interrupt-controller': {'#interrupt-cells': 1, 'compatible': ['riscv,cpu-intc'], 'interrupt-controller': True}, '$nodename': ['cpu@1']}
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@1: Unevaluated properties are not allowed ('riscv,isa' was unexpected)
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@10: False schema does not allow {'device_type': ['cpu'], 'compatible': ['riscv'], 'reg': [[16]], 'riscv,isa': ['rv64imafdc'], 'mmu-type': ['riscv,sv48'], 'cpu-idle-states': [[17], [18], [19], [20]], 'interrupt-controller': {'#interrupt-cells': 1, 'compatible': ['riscv,cpu-intc'], 'interrupt-controller': True}, '$nodename': ['cpu@10']}
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@10: Unevaluated properties are not allowed ('riscv,isa' was unexpected)
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@11: False schema does not allow {'device_type': ['cpu'], 'compatible': ['riscv'], 'reg': [[17]], 'riscv,isa': ['rv64imafdc'], 'mmu-type': ['riscv,sv48'], 'cpu-idle-states': [[17], [18], [19], [20]], 'interrupt-controller': {'#interrupt-cells': 1, 'compatible': ['riscv,cpu-intc'], 'interrupt-controller': True}, '$nodename': ['cpu@11']}
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@11: Unevaluated properties are not allowed ('riscv,isa' was unexpected)
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
make[2]: *** Deleting file 'Documentation/devicetree/bindings/riscv/extensions.example.dts'
Documentation/devicetree/bindings/riscv/extensions.yaml:149:1: found character '\t' that cannot start any token
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/riscv/extensions.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/riscv/cpus.example.dtb: cpu@0: False schema does not allow {'clock-frequency': 0, 'compatible': ['sifive,rocket0', 'riscv'], 'device_type': ['cpu'], 'i-cache-block-size': 64, 'i-cache-sets': 128, 'i-cache-size': 16384, 'reg': [[0]], 'riscv,isa-base': ['rv64i'], 'riscv,isa-extensions': [1761635584, 1627415296], 'interrupt-controller': {'#interrupt-cells': 1, 'compatible': ['riscv,cpu-intc'], 'interrupt-controller': True}, '$nodename': ['cpu@0']}
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/riscv/cpus.example.dtb: cpu@0: Unevaluated properties are not allowed ('riscv,isa-base', 'riscv,isa-extensions' were unexpected)
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/riscv/cpus.example.dtb: cpu@1: False schema does not allow {'clock-frequency': 0, 'compatible': ['sifive,rocket0', 'riscv'], 'd-cache-block-size': 64, 'd-cache-sets': 64, 'd-cache-size': 32768, 'd-tlb-sets': 1, 'd-tlb-size': 32, 'device_type': ['cpu'], 'i-cache-block-size': 64, 'i-cache-sets': 64, 'i-cache-size': 32768, 'i-tlb-sets': 1, 'i-tlb-size': 32, 'mmu-type': ['riscv,sv39'], 'reg': [[1]], 'tlb-split': True, 'riscv,isa-base': ['rv64i'], 'riscv,isa-extensions': [1761635584, 1627416064, 1677746944], 'interrupt-controller': {'#interrupt-cells': 1, 'compatible': ['riscv,cpu-intc'], 'interrupt-controller': True}, '$nodename': ['cpu@1']}
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/riscv/cpus.example.dtb: cpu@1: Unevaluated properties are not allowed ('riscv,isa-base', 'riscv,isa-extensions' were unexpected)
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/riscv/cpus.example.dtb: cpu@0: False schema does not allow {'device_type': ['cpu'], 'reg': [[0]], 'compatible': ['riscv'], 'mmu-type': ['riscv,sv48'], 'riscv,isa-base': ['rv64i'], 'riscv,isa-extensions': [1761635584, 1627416064, 1677746944], 'interrupt-controller': {'#interrupt-cells': 1, 'interrupt-controller': True, 'compatible': ['riscv,cpu-intc']}, '$nodename': ['cpu@0']}
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/riscv/cpus.example.dtb: cpu@0: Unevaluated properties are not allowed ('riscv,isa-base', 'riscv,isa-extensions' were unexpected)
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1506: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250114-counter_delegation-v2-4-8ba74cdb851b@rivosinc.com

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
