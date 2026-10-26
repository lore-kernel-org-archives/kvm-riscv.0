Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBA5606A31A
	for <kvm-riscv@archiver.kernel.org>; Mon, 26 Oct 2026 02:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JXhfEJeQ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=J8uHz68i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EDJQMMMC/FeqI848pdMO3QHdjQXN4SWmNiDvDkMpfBA=; b=JXhfEJeQ/oo+RcsY0dsKbIzRdY
	1NGdlgdaeLNl9EB9AjqwoiLVHE/Byu53HMVGPKopwwYv3jXzy3eQhxsR/UBc8LhNXJ7Mlma3nLfF5
	rNmNFRDA8sKQ+XWyCgMXFKKpoFb2IELbyyHA8DCTCjNcKi6cBj9HHp1AGiAOI4wY1iYd1tjVfbmiv
	NcWiIc7D2eT3OJ/9SegO8N5XPTwUtjfhscwyUMW+xkVppyMeJqqRMEHZcaAXL90YKpOIiZfv1YmaN
	P6pYh48TrAd13QsOVj+4wFVWnc0e2n0TqbkfqwI+451taUftOnBXyYSxafGnQ41olx0rAjgcB1zf/
	yx1mb7HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLArT-00000001dXn-0RDB;
	Mon, 26 Oct 2026 02:54:59 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLArQ-00000001dXR-2imU
	for kvm-riscv@lists.infradead.org;
	Mon, 26 Oct 2026 02:54:58 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-15ea896ddc8so4304800c88.0
        for <kvm-riscv@lists.infradead.org>; Sun, 25 Oct 2026 19:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792983293; x=1793588093; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O/IOyk0aeiwbjnpRPbiHFXjKM3OS9bO6qM44PQ6xvNk=;
        b=J8uHz68iBhMthdONQWztVNqdc9fD4r9sq2OQ9g9GaPIaLCSKQUZnPREXJ//VFMP6oq
         makpC/yw0GhLaxKP92OKDHSvlrrOgAYI1bgj9TWVV4Y1GS9dlEuWfu5v/GH+Bo4smGF6
         2U9JvbaceZFA7jDPEhp4BveRBucoc/bbpY+Ndn/ZCDzCvDGwjUwZRYaHKt4UFtUztZpT
         Tt1uanqPfDJbg9jmcJp00gPM7o1k91yGqLSVXMiFH6Gh6QZEw/iOIWY8Mn04SPcJmfMS
         86GONCvHHqaq7CIS+QkTruPHYsUmJcq2PkUhOEnJuOYNpmVjTeSnXBizLrIRwJWWBvJP
         gqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792983293; x=1793588093;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O/IOyk0aeiwbjnpRPbiHFXjKM3OS9bO6qM44PQ6xvNk=;
        b=puiQpCjsXtMNCuGNRVsGY6Spt5ph16dY+V2IT677XRWu0eudKuD0fkhjLCjpYHi8BO
         kaTvgTf+XOcg02U5xtRtNbngQEEGLXtI7bUmcZZurNpGflRDN2ZeqACCTgVTJWy6ASGk
         jyoN1yqeYlhxXI9Vcg2Bes+QeeIVHsB6TsLRfEYQ4GuQaXccWKmsgJapDwwzwzmVH8ue
         ja8RLcRgF4//708YZ4Akt8/j/VhkSoQUKmIAy7f4ROqjvcrlUokG5uLX6XDYPcLVHtCn
         G9qixeEUtttcqwTJunH34Y8mjxnObj9hvXSaKVV4eQfXYuiuwyI0zJhO2vBgwY/6n0Nr
         6XXg==
X-Forwarded-Encrypted: i=1; AKwUvBwt3osQnh6QC23nGhQtCpliFLxDw2NMNPPq/7iTnrEtSbvBHfnhL0e0qNhg/RHku4IFnAkoVzNJu00=@lists.infradead.org
X-Gm-Message-State: AFq9FYLlnHY1mjNH6nRXveOOVFG9+i+2bfxoh0Op4VxWeDzf3FiABTx7
	Ds7gJb1OsEeDo8IfC8eouXCGxf3j3xBVv7DLBUb+0tk8Ck9eINJwo2Yf6feKSPGoTXMmPAz2yeJ
	1UyQCmLuvOQ==
X-Gm-Gg: AYBFou1AZO5tmtNWxLnh35BOiejQeCfMCjkVykSjlwRzmVNt/lahoZQWnXNQaTL1WCn
	fIcps8zwMXtVauke/al80gBp36d1oUWwK7k9IR/Bwn/UHpZ4eIQJqWGViHNTlfHPyvQyw4WzgL1
	xH5aobrxDsIeBXtMifmRP/wslwgX4PQjMMHcBwIXbEGfLiypLTGpMZOLD8b6e4xWZSWLq9TbmmH
	c3AA6ET3ngmmsSdMMGNQn14T00Na2+xaIg/qjn7QeKj0vaagZfSQgAH6bgpI/hvZeUkhKnDQ8Er
	ncEE2QcwYWVfNHENjBXR7atU5CjdqbmAFC4yujEo8hxewLDv09iLs2SM59Fn7+9PgmL34ExNKXA
	FNelKOyakn4q1WnpP7DUk9zoHmZvJMzVvkL7BhOWVmbWVh+LJt8qCxAYY+KfnDPXGlWFiYzw8Gd
	LiWFQxkQsHae8TGFghmR9X21+rnCJqo0+8t6C96wQmcX2MnJ2/478t+Dh0awx9jx8lZN7xwBg1P
	4avQ2wS0cJN4EaT99REo5NCH8tDeVHLPEkK++87d/r4iPx9wQii2EA55LSkmgZ9nZmZYJyE7W2L
	7qF58cMBPA==
X-Received: by 2002:a05:7022:4585:b0:147:a685:912d with SMTP id a92af1059eb24-1993580ef4cmr11608601c88.29.1792983292830;
        Sun, 25 Oct 2026 19:54:52 -0700 (PDT)
Received: from smtpclient.apple ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee69sm27803493c88.4.2026.10.25.19.54.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 25 Oct 2026 19:54:51 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [External] [kvm-unit-tests PATCH] riscv: sbi: Fix timer delay
 measurement race
From: Qingwei Hu <qingwei.hu@bytedance.com>
In-Reply-To: <atsy0DXLV-WNdi-c@orel>
Date: Mon, 26 Oct 2026 10:54:36 +0800
Cc: kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org,
 James Raphael Tiovalen <jamestiotio@gmail.com>
Message-Id: <F7E4D434-C723-4739-8EC3-1A8EA6C2F3E8@bytedance.com>
References: <20261023030442.3709880-1-qingwei.hu@bytedance.com>
 <atsy0DXLV-WNdi-c@orel>
To: Andrew Jones <andrew.jones@linux.dev>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_195457_034248_7C82616F 
X-CRM114-Status: GOOD (  20.57  )
X-Spam-Score: -2.1 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


> On Oct 23, 2026, at 18:13, Andrew Jones <andrew.jones@linux.dev> wrote:
> 
> On Fri, Oct 23, 2026 at 11:04:42AM +0800, Qingwei Hu wrote:
>> The timer test samples the counter before checking timer_works in the
>> wait loop. If the timer interrupt arrives between these operations, the
>> handler sets timer_works and the loop exits with a timestamp taken before
>> the interrupt. That timestamp can precede the deadline, causing a false
>> "timer delay honored" failure in both the normal and masked IRQ tests.
>> 
>> Record the counter at the start of timer_irq_handler() and use it to
>> calculate the elapsed time. Keep the loop timestamp for timeout detection.
>> 
>> Fixes: 14fa12b1351c ("riscv: sbi: Add test for timer extension")
>> Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
>> ---
>> riscv/sbi.c | 4 +++-
>> 1 file changed, 3 insertions(+), 1 deletion(-)
>> 
>> diff --git a/riscv/sbi.c b/riscv/sbi.c
>> index 3b8aadce..a298228b 100644
>> --- a/riscv/sbi.c
>> +++ b/riscv/sbi.c
>> @@ -245,6 +245,7 @@ struct timer_info {
>> bool timer_irq_set;
>> bool timer_irq_cleared;
>> unsigned long timer_irq_count;
>> + unsigned long irq_cycles;
>> };
>> 
>> static struct timer_info timer_info;
>> @@ -256,6 +257,7 @@ static bool timer_irq_pending(void)
>> 
>> static void timer_irq_handler(struct pt_regs *regs)
>> {
>> + timer_info.irq_cycles = timer_get_cycles();
>> timer_info.timer_works = true;
>> 
>> if (timer_info.timer_irq_count < ULONG_MAX)
>> @@ -304,7 +306,7 @@ static void timer_check_set_timer(bool mask_timer_irq)
>> }
>> 
>> if (timer_info.timer_works) {
>> - duration = end - begin;
>> + duration = timer_info.irq_cycles - begin;
>> report(duration >= d && duration <= (d + margin), "timer delay honored%s", mask_test_str);
>> }
>> 
>> -- 
>> 2.39.5
>> 
> 
> Hi Qingwei,
> 
> Your patch is fine, but I think we could also just change the loop a bit
> 
>    while (!timer_info.timer_works && timer_get_cycles() <= begin + d + margin)
>        cpu_relax();
>    end = timer_get_cycles();
> 
> Thanks,
> drew

Hi Drew,

Thanks for this tip. I have tested that the recommended code is useful.

I'll send a v2 with your suggested change.

Thanks,
Qingwei


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
