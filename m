Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B58C53219
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 19:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WXBAjGAoTWR7wKgmz1QOLFR9ujePXjI3msSfxyo7iro=; b=UbXmzYM8irxU1nu1t5wmRilVsH
	O7i6wKxKAn0Zzs4gnJwPBVO721WHlJ8g1vSmG9o0uwxVDf7rAUtOPGbzFmTfBHJaSLCBh8pEFPXLU
	y8I1uSMwpNutYxjjCyDPTHbh05bbaS4Du3g5VFhAj/vbezpDFMJzW4ZeE1IyVxlxLPI/VkA4dDvDa
	2f3YkVrYDutT5Swsb6uu8rlMMQe3NuNDah03PT0WqIOsYHebi/INBjjCA7sbbl8DyMXd1lrsiENB0
	NSsbjEGYDZaEqV9BtsiBQPD2g7oCfBlCwVHQmOF5PCEu9gDz+8d1y1ij37m56AGVSSZeeKk0SyUV4
	8/YbYPWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp9jZ-00000008s3v-2lXu;
	Wed, 29 Jul 2026 19:14:29 +0000
Received: from mail-pg1-x548.google.com ([2607:f8b0:4864:20::548])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp9jW-00000008s3Q-2PM2
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 19:14:28 +0000
Received: by mail-pg1-x548.google.com with SMTP id 41be03b00d2f7-c856470fe9fso1145327a12.2
        for <kvm-riscv@lists.infradead.org>; Wed, 29 Jul 2026 12:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785352465; x=1785957265; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k+h3h28T4F1i6amtJLbBYljCpqUwi0VZ2BDIbc8sgVg=;
        b=LA+2fCRejZlPUsdCUtWmoH1Rw47udRksLumlYf1dffAjn/XjjHbPxvNwgTcdio+1Sw
         i1dqsPKcBdWwzQPDl0e8sZsWeNqcV5S0ou6zUIZzdELMyrNDWTAC7gDMN1qlYS5kHb5N
         r2RHvKExKQlUNhMWAAW82KGKEFsrmqYV1Ms5F4XYAIjMb9x//bwQkGMYcZBn2EG1o0eK
         ycDrrR1ZC0Ip+0vr0XSbbFYoyMxO+UFt0FtiZ0/7Wnt6Fkj1QuFdqJ/6UYUEB1/iJjCM
         sWgqnkYwsWLs5mE+ZxKR1fNLWjxDMsT4wweyFT9v0f9qzf1tuUyaQWlZqqaOEW7fwng4
         h8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785352465; x=1785957265;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k+h3h28T4F1i6amtJLbBYljCpqUwi0VZ2BDIbc8sgVg=;
        b=Mh6k1CPzqXDB5nqpAqGu1vEh6DjkwHgH9sLvmrQ8E5cCJYFBCNP3YKe66+4cpeyBU0
         xEuGZA7Rtb0fxm4CrRDNzRng2KALmQIZsRkystLoObbXdfcta/4Z9iET9WU2vNiNdlUY
         S/VNa/p+Yg51q382FnRoPKyQ+l0oUsYeucv4UGabVirbnmVsGctMJy7xqZ3H50q6CJiS
         7cG5HsJzq5uL3egJy60SFG+iXCkd9xaSSD/GQYAhvs3jknGjjxJNYG0VhP7RYJKRUsL9
         PHf4v0ZzXWWrpTfWm9FZ4I8B4gTxcD4uUPC+AT7WPrldlppG/J1Geoq/nn2UzaXOqRrf
         3pKw==
X-Forwarded-Encrypted: i=1; AHgh+RqxCy+cuOQFFBZUkDfwhUTt351l+W9ksHSstx8hmB2QTF3sNFBZoEgj8o/H+BlF7qJ4bqiXcApVVDY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwrxTynzFaUIsdtmGUQ7w+yltsok0KHXazwbIAzh3OuGicxvmfS
	cN+EzRkAJztrwwWghe7WIjHfJhJM+qlqkNwl7/L37//1sZAUwgt/KEr6+MVeAbio0+qA3HUbDFV
	WLck8HA==
X-Received: from pgae5.prod.google.com ([2002:a63:3705:0:b0:cb2:54cf:afe5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3204:b0:3c6:5673:2bd1
 with SMTP id adf61e73a8af0-3c8ba5da101mr8929380637.42.1785352465072; Wed, 29
 Jul 2026 12:14:25 -0700 (PDT)
Date: Wed, 29 Jul 2026 12:14:24 -0700
In-Reply-To: <20260331194202.1722082-7-vipinsh@google.com>
Mime-Version: 1.0
References: <20260331194202.1722082-1-vipinsh@google.com> <20260331194202.1722082-7-vipinsh@google.com>
Message-ID: <ampREGtEqKh8_-Ua@google.com>
Subject: Re: [PATCH v4 6/9] KVM: selftests: Add various print flags to KVM
 selftest runner
From: Sean Christopherson <seanjc@google.com>
To: Vipin Sharma <vipinsh@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	pbonzini@redhat.com, borntraeger@linux.ibm.com, frankja@linux.ibm.com, 
	imbrenda@linux.ibm.com, anup@brainfault.org, atish.patra@linux.dev, 
	zhaotianrui@loongson.cn, maobibo@loongson.cn, chenhuacai@kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_121426_614513_0E8398DF 
X-CRM114-Status: UNSURE (   8.76  )
X-CRM114-Notice: Please train this message.
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

On Tue, Mar 31, 2026, Vipin Sharma wrote:
> @@ -27,10 +34,14 @@ class TestRunner:
>          return test
>  
>      def _log_result(self, test_result):
> -        logger.info("*** stdout ***\n" + test_result.stdout)
> -        logger.info("*** stderr ***\n" + test_result.stderr)
> -        logger.log(test_result.status,
> -                   f"[{test_result.status.name}] {test_result.test_path}")
> +        print_level = self.print_stds.get(test_result.status, "full")
> +
> +        if (print_level == "full" or print_level == "stdout"):
> +            logger.info("*** stdout ***\n" + test_result.stdout)

IMO, when the print_level is exactly stdout or stderr, the runner shouldn't spit
out the "*** std{out,err} ***" line, as it's pure noise.  E.g.

        print("\033[2K", end="\r", flush=True)
        if (print_level == "full"):
            logger.info("*** stdout ***\n" + test_result.stdout)
            logger.info("*** stderr ***\n" + test_result.stderr)
        elif (print_level == "stdout"):
            logger.info(test_result.stdout)
        elif (print_level == "stderr"):
            logger.info(test_result.stderr)

> +        if (print_level == "full" or print_level == "stderr"):
> +            logger.info("*** stderr ***\n" + test_result.stderr)
> +        if (print_level != "off"):
> +            logger.log(test_result.status, f"[{test_result.status.name}] {test_result.test_path}")
>  
>      def start(self):
>          ret = 0
> -- 
> 2.53.0.1118.gaef5881109-goog
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
