Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E58ECD98C5
	for <kvm-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 01:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E22CBUM5zGR6LmQ69VrkH2A9snCgz/xQA2Znja/AXwg=; b=banCUw4yz4Enlb
	3zAfBDPuVgH0RAYGrdHKfdGEQZC6CvtHzgXfUDIgUhbbESiVk1QN8KtChrvxTL74MuJxKXfow+uRl
	EzfGU8+oC1ZpVDSB6UiePzLQPnTpLN5j7bCe1KrKcROeRpPqg7HQclOQzSEePsM8P8xfc3dAc+T59
	bDOVmc2n3rENsEOdvniXKUkgGMLv0dK2PvM4cA4LsH1/KZQzEnSZPLRNJpnIFbiBdMd+GOweL7OOv
	55uR7rISHXNg8obq5J5PRcMiYHm0RJdbPabz4UqQSKcIPHtyuyFYAF2Q3/WJIf8HId6zg9oi63iub
	1NAbyEF/WlBlaxhUpSxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYw09-0000000DRGx-2qb0;
	Mon, 15 Jun 2026 01:20:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYw08-0000000DRGm-1tkI;
	Mon, 15 Jun 2026 01:20:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AFB5643C60;
	Mon, 15 Jun 2026 01:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF2281F000E9;
	Mon, 15 Jun 2026 01:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781486431;
	bh=rYwZ2eVwOLWaAkHwno3LEyxTco9cvFVt3Q1mmJlReC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MXsx03WdITf3HmhydUJ5OgLaBLMaOPcBcBuaaknFTU+pFovh4q4XfVpGTDNjnrTZ0
	 YS1kq51da+JmogOuO3uZeyw7zVfkNE41FmDX9Di8SMow0AgMua7o1ZP7NgiDNxjuqX
	 l1xsT1vZc/uJA7BM24vbEkFL2TKwirUmPw9+iZKPvWAufBxgprFX6HxBiRFbSBc7b4
	 uuYrzzjcNsltJAeQCx4M0UBzMN4YcgTbR1sTm0fEQl1iBreBf+pV+8vaNAPzLsAF6M
	 8ac26hwL+1RIkpxZTXfcWXAjDxkTMuJDmtvfHcPpZeKd89e7nJQNrTe4aRcxGc6LAG
	 p413kxgkTuC+Q==
Date: Mon, 15 Jun 2026 01:20:29 +0000
From: Yixun Lan <dlan@kernel.org>
To: Guodong Xu <docular.xu@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
	spacemit@lists.linux.dev, sophgo@lists.linux.dev,
	linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH v4 10/16] riscv: dts: spacemit: k3: Add Zic64b ISA
 extension
Message-ID: <20260615012029-GKA1003249@kernel.org>
References: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
 <20260611-rva23u64-hwprobe-v2-v4-10-3f01a2449488@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260611-rva23u64-hwprobe-v2-v4-10-3f01a2449488@gmail.com>
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

Hi Guodong,

On 16:12 Thu 11 Jun     , Guodong Xu wrote:
> The K3 X100 cores have 64-byte cache blocks, already described by their
> cbom/cbop/cboz-block-size of 64, so they implement Zic64b, a mandatory
> RVA23 extension.  Declare it in each core's riscv,isa-extensions.
> 
> Signed-off-by: Guodong Xu <docular.xu@gmail.com>

Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
> v4: No change.
> v3: New patch.
> ---
>  arch/riscv/boot/dts/spacemit/k3.dtsi | 48 ++++++++++++++++++------------------
>  1 file changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> index 4ac457399b583..b5aa983f0bfa1 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -35,9 +35,9 @@ cpu_0: cpu@0 {
>  					       "svinval", "svnapot", "svpbmt", "za64rs",
>  					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
>  					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
> -					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
> -					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
> -					       "zicond", "zicsr", "zifencei", "zihintntl",
> +					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
> +					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
> +					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
>  					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
>  					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
>  					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
> @@ -76,9 +76,9 @@ cpu_1: cpu@1 {
>  					       "svinval", "svnapot", "svpbmt", "za64rs",
>  					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
>  					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
> -					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
> -					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
> -					       "zicond", "zicsr", "zifencei", "zihintntl",
> +					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
> +					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
> +					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
>  					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
>  					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
>  					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
> @@ -117,9 +117,9 @@ cpu_2: cpu@2 {
>  					       "svinval", "svnapot", "svpbmt", "za64rs",
>  					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
>  					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
> -					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
> -					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
> -					       "zicond", "zicsr", "zifencei", "zihintntl",
> +					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
> +					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
> +					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
>  					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
>  					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
>  					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
> @@ -158,9 +158,9 @@ cpu_3: cpu@3 {
>  					       "svinval", "svnapot", "svpbmt", "za64rs",
>  					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
>  					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
> -					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
> -					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
> -					       "zicond", "zicsr", "zifencei", "zihintntl",
> +					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
> +					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
> +					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
>  					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
>  					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
>  					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
> @@ -199,9 +199,9 @@ cpu_4: cpu@4 {
>  					       "svinval", "svnapot", "svpbmt", "za64rs",
>  					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
>  					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
> -					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
> -					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
> -					       "zicond", "zicsr", "zifencei", "zihintntl",
> +					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
> +					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
> +					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
>  					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
>  					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
>  					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
> @@ -240,9 +240,9 @@ cpu_5: cpu@5 {
>  					       "svinval", "svnapot", "svpbmt", "za64rs",
>  					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
>  					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
> -					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
> -					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
> -					       "zicond", "zicsr", "zifencei", "zihintntl",
> +					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
> +					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
> +					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
>  					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
>  					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
>  					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
> @@ -281,9 +281,9 @@ cpu_6: cpu@6 {
>  					       "svinval", "svnapot", "svpbmt", "za64rs",
>  					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
>  					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
> -					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
> -					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
> -					       "zicond", "zicsr", "zifencei", "zihintntl",
> +					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
> +					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
> +					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
>  					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
>  					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
>  					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
> @@ -322,9 +322,9 @@ cpu_7: cpu@7 {
>  					       "svinval", "svnapot", "svpbmt", "za64rs",
>  					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
>  					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
> -					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
> -					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
> -					       "zicond", "zicsr", "zifencei", "zihintntl",
> +					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
> +					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
> +					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
>  					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
>  					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
>  					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
> 
> -- 
> 2.43.0
> 

-- 
Yixun Lan (dlan)

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
