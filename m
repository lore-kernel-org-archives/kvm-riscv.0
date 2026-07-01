Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68567C43458
	for <kvm-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 15:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bcjK52lnhvpdHjJZJ9k97xs723NeoZ4XZPKsKrMjEYI=; b=LvVCGuGNwRfN7VihbSPqo9N83d
	g1ABsBTDkGaCbW1gbWTbI7bRw3fWn4Y/u9VPapVW0Cx9jXd9TbsjPwV/vCDtf1OMpStkn6lJegdm/
	Gq0s+0Z+hliocgrbw3NLbCwhpKN7ivesIM9so+BguJPRI4pGZfCKxvWk7LamOgDr0ZlFs99d6hJR5
	mA+R5NJHfkT7WGql3Q6ufF06GxgqcIq9Wl+U4M0kVh8Zyb+FqfLWek8Efhbsg0X0p13yYKUAbCB7w
	1U5seTqwLSxzANWJbD4k1B86PLtWoyDjDTST+va7oI8BgwhDb3/RIK9UZfJPbiWlUcBmjtr8oi97O
	b6gloxGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexGR-00000002Rjz-48l2;
	Wed, 01 Jul 2026 15:54:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexGQ-00000002RjW-1eve;
	Wed, 01 Jul 2026 15:54:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 825246001D;
	Wed,  1 Jul 2026 15:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E90E71F000E9;
	Wed,  1 Jul 2026 15:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782921253;
	bh=Day1pHQbKZLb168bI+sP1UZxbLRw56ZZ/BDr3gtOMiQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=OEOXN1CbmqbmzOHS4xMU9zz61FwVoCI0s68qSt/fMFnPQAtQDSI9WRjlK+tUTfm7W
	 YMGFkMn0G8o79DO1GWLJHoAFBmpvbYb7AMyNFQ1CBAOH3lIZ1XdwqwfXztENUdEGOP
	 VsJ8LHmL5fgC5eFahjw3d+/4fx6zGP30xf5NOjXyx57RHcxnBNqPOqpIcjlEu09pgX
	 kM2HD76Qskh2xjdNXvo423hw6HGkgGW4VB6wuRzMNJ90GISmxlQfHInTfCe6v9hs0B
	 S3fk2J2JC82vh8hKsk0tW2YbnNLhgV8eJWG7PcgoKKGbVj8C8+JV1L+g+4CbHU04gr
	 MuldJFsj5M1IQ==
Date: Wed, 01 Jul 2026 10:54:12 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Deepak Gupta <debug@rivosinc.com>, sophgo@lists.linux.dev, 
 Conor Dooley <conor.dooley@microchip.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Jonathan Corbet <corbet@lwn.net>, Inochi Amaoto <inochiama@gmail.com>, 
 kvm@vger.kernel.org, spacemit@lists.linux.dev, 
 Jesse Taube <jtaubepe@redhat.com>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, linux-doc@vger.kernel.org, 
 Zong Li <zong.li@sifive.com>, Conor Dooley <conor@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, Albert Ou <aou@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, 
 Chen Wang <chen.wang@linux.dev>, linux-kselftest@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>
To: Guodong Xu <docular.xu@gmail.com>
In-Reply-To: <20260701-rva23u64-hwprobe-v2-v5-8-2c61f94a695a@gmail.com>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
 <20260701-rva23u64-hwprobe-v2-v5-8-2c61f94a695a@gmail.com>
Message-Id: <178292125218.626337.4829523300943840761.robh@kernel.org>
Subject: Re: [PATCH v5 08/17] dt-bindings: riscv: Require block-size for
 Zicbom, Zicbop, and Zicboz
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


On Wed, 01 Jul 2026 08:52:21 -0400, Guodong Xu wrote:
> Zicbom, Zicbop, and Zicboz have no default cache block size, so a
> devicetree that declares one must also provide the matching
> riscv,cbom/cbop/cboz-block-size property. Make it required so a
> missing block-size property can be caught by dtbs_check.
> 
> Suggested-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Guodong Xu <docular.xu@gmail.com>
> ---
> v5: New patch.
> ---
>  .../devicetree/bindings/riscv/extensions.yaml      | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@0 (riscv): 'riscv,cbom-block-size' is a required property
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@0 (riscv): 'riscv,cbop-block-size' is a required property
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@0 (riscv): 'riscv,cboz-block-size' is a required property
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@0 (riscv): Unevaluated properties are not allowed ('riscv,isa' was unexpected)
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@1 (riscv): 'riscv,cbom-block-size' is a required property
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@1 (riscv): 'riscv,cbop-block-size' is a required property
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@1 (riscv): 'riscv,cboz-block-size' is a required property
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@1 (riscv): Unevaluated properties are not allowed ('riscv,isa' was unexpected)
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@10 (riscv): 'riscv,cbom-block-size' is a required property
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@10 (riscv): 'riscv,cbop-block-size' is a required property
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@10 (riscv): 'riscv,cboz-block-size' is a required property
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@10 (riscv): Unevaluated properties are not allowed ('riscv,isa' was unexpected)
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@11 (riscv): 'riscv,cbom-block-size' is a required property
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@11 (riscv): 'riscv,cbop-block-size' is a required property
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@11 (riscv): 'riscv,cboz-block-size' is a required property
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@11 (riscv): Unevaluated properties are not allowed ('riscv,isa' was unexpected)
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260701-rva23u64-hwprobe-v2-v5-8-2c61f94a695a@gmail.com

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
