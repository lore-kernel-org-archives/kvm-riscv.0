Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE16C369C2
	for <kvm-riscv@archiver.kernel.org>; Wed, 23 Apr 2025 00:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YGWPwmVlfcq6iIpMj2O5yQjlsrvuEVopCBGBcufPpc8=; b=EBCyFtA7u0NNfU
	+a4bTeHtr0kxmkEvMnVRD6CPVlTpVRYPN2f7kJ3qH5NWpx2hOqwMphwm/udLY/d7rHFE032UM5MmO
	5MfHTCzzEPU4QOqWH4lrz7l9J9N6tzlrt+wyWYFOdNk3c2NQ9tYjaezticySV2kjbcpssl5G0ArzN
	WeSP6vhmSMqzr6riO2ru3ZsOsiF10ijO6LZVLtEPa91Y0GKijfw7/szUJp7W4lSNPYfHEZyQGfi8w
	hu4YcdPwa3Y9NTrfcuxf2LosA1+qI5I2h5DzFq0VtRhaEJkmX8GMq69Woefgl4iKJMi7m7MY7Z7mp
	2bFfRCaZX7er2MSdIP9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7NoV-00000008sNM-45SR;
	Wed, 23 Apr 2025 00:18:07 +0000
Received: from out-174.mta0.migadu.com ([91.218.175.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7NoU-00000008sMF-1TQd
	for kvm-riscv@lists.infradead.org;
	Wed, 23 Apr 2025 00:18:07 +0000
Message-ID: <9d827020-ee6c-40c2-a83d-7eb9a00f8aa8@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745367484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QxWWJwIhRG++LmaYSHq+CfihXUQKS791vet7ACFep64=;
	b=ZXnPxwMIzj+wa71041mXF8qVCG8DMEdoDp5cKh6/OMUSbnHJsUOr8pPMBvEd3bQ/lHmxd/
	261GdghcLYCbTAGewnTK4Ot6fNFDvrhR49od4TTjQzTj23cS2qBBQ4F8ovitKxuEcZ+fxm
	Zux3jbOBlbr4jgIwtMYVJCM6Qj1SoZM=
Date: Tue, 22 Apr 2025 17:17:56 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v5 20/21] tools/perf: Pass the Counter constraint values
 in the pmu events
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Adrian Hunter <adrian.hunter@intel.com>
References: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
 <20250327-counter_delegation-v5-20-1ee538468d1b@rivosinc.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250327-counter_delegation-v5-20-1ee538468d1b@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_171806_543261_FE4E920B 
X-CRM114-Status: GOOD (  19.84  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On 3/27/25 12:36 PM, Atish Patra wrote:
> RISC-V doesn't have any standard event to counter mapping discovery
> mechanism in the ISA. The ISA defines 29 programmable counters and
> platforms can choose to implement any number of them and map any
> events to any counters. Thus, the perf tool need to inform the driver
> about the counter mapping of each events.
> 
> The current perf infrastructure only parses the 'Counter' constraints
> in metrics. This patch extends that to pass in the pmu events so that
> any driver can retrieve those values via perf attributes if defined
> accordingly.
> 

Hi Ian/Arnaldo/Namhyung,
Any thoughts on this patch ? Please let me know if there are any other 
better approaches to pass the counter constraints to the driver ?

The RISC-V pmu driver maps the attr.config2 with counterid_mask value
so that driver can parse the counter restrictions.


> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>   tools/perf/pmu-events/jevents.py | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
> index fdb7ddf093d2..f9f274678a32 100755
> --- a/tools/perf/pmu-events/jevents.py
> +++ b/tools/perf/pmu-events/jevents.py
> @@ -274,6 +274,11 @@ class JsonEvent:
>           return fixed[name.lower()]
>         return event
>   
> +    def counter_list_to_bitmask(counterlist):
> +      counter_ids = list(map(int, counterlist.split(',')))
> +      bitmask = sum(1 << pos for pos in counter_ids)
> +      return bitmask
> +
>       def unit_to_pmu(unit: str) -> Optional[str]:
>         """Convert a JSON Unit to Linux PMU name."""
>         if not unit or unit == "core":
> @@ -427,6 +432,10 @@ class JsonEvent:
>         else:
>           raise argparse.ArgumentTypeError('Cannot find arch std event:', arch_std)
>   
> +    if self.counters['list']:
> +      bitmask = counter_list_to_bitmask(self.counters['list'])
> +      event += f',counterid_mask={bitmask:#x}'
> +
>       self.event = real_event(self.name, event)
>   
>     def __repr__(self) -> str:
> 


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
