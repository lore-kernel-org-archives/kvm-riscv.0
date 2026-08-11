Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CDBC5CFE7
	for <kvm-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 17:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gyohZHyDF75ClKi441aqIkXpu8jlIAInmqzKKH31km4=; b=mHV95ydT3H8+3RYtoyPHMRdWVR
	ccREWoxJ9jHn3jmUKa9heumEMpLKTrdyY5hJEutRKLQ/GWB/J2b0XRwcMrxgBy74rQNB4AvW0jazt
	+MUGovlikSCqvDLb+5WVYKzQ5Id2GguJdMySCEyd7bW8c6fW1Ycy14FsRHA65ujUN/oTrn31OPG0s
	3P3evntpiedVocrxIbeakWHM44mfV/fbQSGTo9FIyX0l5G6Dd31e+rqIXu8GfXnRnOt5ORJ3ixrF6
	rW98iHApp67eSzWAgNiFqJcYdekDsdy7gGfQ8ZFP7ho5OHrf3KdFVE6JNTk08vlArSFvaYcyAai49
	uXN6AQGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtq7j-0000000EceZ-35ul;
	Tue, 11 Aug 2026 17:18:47 +0000
Received: from mail-pf1-x445.google.com ([2607:f8b0:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtq7h-0000000EcdF-0Dhu
	for kvm-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 17:18:46 +0000
Received: by mail-pf1-x445.google.com with SMTP id d2e1a72fcca58-8487eb67173so167691b3a.2
        for <kvm-riscv@lists.infradead.org>; Tue, 11 Aug 2026 10:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786468723; x=1787073523; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AtIGM2NHe8OV4DKgN1nHk9aAoS7uuH7cfv4s5R8wW14=;
        b=nS8OAauBmLYP/RnTef+SEw2rtlwTKsjT9ficnxC8IVi4511O+o+owbS7dBrDTV6Oje
         t3M0+nyUkSEH+/SC4EB1OmHdGaP8NIrRufIqG9sFKsarGzhqwrLtfHouM0D9IVLAru1b
         1XKdExAQ2omJhcm5vpqEdKTvtfo8JDu61On7l8U2PzRPveyyW1HKhibXXFjZ7kihc5Oq
         qla2KylQr0obqKdd7CxN+LI4Vm1DLPCTVjKsEfpHYjb/hLFJN5kgNuOuuRDvRzWpEGyK
         xanIT3ncCWa/kBuUhm01k+rXIfPKducwlU71jUSFCxkqLXKKfemGbxBCtPu0/uXOefIc
         av9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786468723; x=1787073523;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AtIGM2NHe8OV4DKgN1nHk9aAoS7uuH7cfv4s5R8wW14=;
        b=dnRBMXcs0JhqqoqtqcFpAOxUuwH1rSwvrUHjOILA8DkXrwm8gJLBGr8KaRfq4+Lrt7
         MQdH0fBBNu8OGivbW/brk1oRtfnh8pBrA65zbnZl7lSUGr5KzycbgZ6IoNaHsrukVIs4
         4/RHOgcDc5OIJ9iF76HC784nOXpOULWTDInePu443i8Kg0VOp3xqCBqBzrIxLYV2MHDH
         /x7//J0wcK8fVATkLuAxxN+TYhtU5eDEDqWA7i+FLtNJUf+nbDcr2etDNPD5+1g/l4hz
         +RC5P8E12TWYmBJURrESIwGvsnjbGWXLE/GKfnvVgH6rq240OOzqp9nWHYeMnHqwm47E
         NZhA==
X-Forwarded-Encrypted: i=1; AHgh+Rp0k6oC9++UZM7fBWoZNqsteobLp7Wj5bkLzsdGn/lKr7Q58xw+I+1acORwrW8S/yybMKJfA+FghbY=@lists.infradead.org
X-Gm-Message-State: AOJu0YypDCOU55I9T2pivjNj6Uh76jl/NbTY6ywoBCZKbafHh7Hjj/WI
	YXBcsnTo7eXYOZ14DncyE3GkBc/SrwQ6gmFUxjaxgHCWhBn5Iug1yAzb3Bsx6Jw5bvf9+MwWpOu
	LPr4D7Q==
X-Received: from pfbds7.prod.google.com ([2002:a05:6a00:4ac7:b0:848:2a35:eb83])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:139e:b0:848:5ed6:9d27
 with SMTP id d2e1a72fcca58-84fafa6094dmr1722392b3a.36.1786468722299; Tue, 11
 Aug 2026 10:18:42 -0700 (PDT)
Date: Tue, 11 Aug 2026 10:18:41 -0700
In-Reply-To: <20260811060134.106973-4-jinyu.tang@linux.dev>
Mime-Version: 1.0
References: <20260811060134.106973-1-jinyu.tang@linux.dev> <20260811060134.106973-4-jinyu.tang@linux.dev>
Message-ID: <antZcYiOR0WKi5Kv@google.com>
Subject: Re: [PATCH 3/3] KVM: selftests: Enable pre_fault_memory_test for RISC-V
From: Sean Christopherson <seanjc@google.com>
To: Jinyu Tang <jinyu.tang@linux.dev>
Cc: Anup Patel <anup@brainfault.org>, Anup Patel <apatel@ventanamicro.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Yong-Xuan Wang <yongxuan.wang@sifive.com>, 
	Nutty Liu <nutty.liu@hotmail.com>, Jinyu Tang <tjytimi@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_101845_122480_E2EBA519 
X-CRM114-Status: GOOD (  14.07  )
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

On Tue, Aug 11, 2026, Jinyu Tang wrote:
> RISC-V now supports KVM_PRE_FAULT_MEMORY, so include the generic
> pre_fault_memory_test in the RISC-V KVM selftest build.
> 
> The test uses PAGE_SIZE from the architecture processor header. Define
> the normal 4K RISC-V selftest page size so the generic test can build
> for RISC-V.
> 
> RISC-V selects VM_MODE_DEFAULT at runtime. Initialize the supported
> guest modes before creating the VM so the generic test can run on
> RISC-V hosts where the default mode is discovered from KVM
> capabilities.
> 
> Signed-off-by: Jinyu Tang <jinyu.tang@linux.dev>
> ---

...

> diff --git a/tools/testing/selftests/kvm/pre_fault_memory_test.c b/tools/testing/selftests/kvm/pre_fault_memory_test.c
> index a0fcae3cb7a8..6eebf0524673 100644
> --- a/tools/testing/selftests/kvm/pre_fault_memory_test.c
> +++ b/tools/testing/selftests/kvm/pre_fault_memory_test.c
> @@ -8,6 +8,7 @@
>  #include <linux/sizes.h>
>  
>  #include <test_util.h>
> +#include <guest_modes.h>
>  #include <kvm_util.h>
>  #include <processor.h>
>  #include <pthread.h>
> @@ -219,6 +220,8 @@ static void test_pre_fault_memory(unsigned long vm_type, bool private)
>  
>  int main(int argc, char *argv[])
>  {
> +	guest_modes_append_default();

Can we do this for all selftests in kvm_selftest_init()?  Or perhaps even better,
handle it in kvm_selftest_arch_init() to avoid the gnarly #ifdefs?

Unless there's a meaningful downside to configuring the supported and default
modes, I don't see any reason to force tests to manually do this work.

> +
>  	TEST_REQUIRE(kvm_check_cap(KVM_CAP_PRE_FAULT_MEMORY));
>  
>  	test_pre_fault_memory(0, false);
> -- 
> 2.43.0
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
