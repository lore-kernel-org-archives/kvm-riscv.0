Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F48C5DF81
	for <kvm-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 23:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wfpco/HSD6GWWUuPhBPbD0d0ltMDqu+OloLObXOmqlc=; b=bspyBvvwoH9ZtG
	ihl/mn0cD/GEt+CDMQn90oJftFfdf+o7QbIKoAfX6tQynvE9othXCd7dpfLsqPEcPbMg+jixjwF/m
	cfwsdjgNCx/wIZeZkalO9pR+7vovEkY4vLoxgnAaX8fNIm+xtxufKXZigoFQAmKG4nLqLGGCAW8Hk
	xmiapj9R6ce9/iLH26BjZMfMQm+MXT00a7SIuCCcrKmJtiAaWmdPOcz0wkUlSqEhtqj+6twZZpD17
	CN8QtraIGKv1Dg11f9zyzT2Vf8Dpi75Y8qe8IYhhv4Rq7NSkezJx+XMs48U3EyLTJVLwDMXn6rP5m
	6UIVdEpTTAkpl4S5S3XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxCK0-0000000CMHP-2jTW;
	Thu, 20 Aug 2026 23:37:20 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxCJx-0000000CMH4-46E3
	for kvm-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 23:37:19 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2d3b440b97aso12115ad.1
        for <kvm-riscv@lists.infradead.org>; Thu, 20 Aug 2026 16:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787269037; x=1787873837; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k+xmfX7DA1IMWAYKfjmQ/Aix3ZtqaekUVXRTDYfDjog=;
        b=NgknSCnuoQvvDz/As5xfmpQL2n6bCPUPSsalbH1DHraLsPMKTZ32QaWlSFRZK5aOGW
         dtCEwSXZckHmfaVey91K8Y4khLraTgFbRcmPNHD3eJAF7DxAMWPejrg4uzfm5lrK5x+s
         R8+S2mnVd8ICP/N67hyN/eNIyAFYY/B/EdoJM1IEzXOE0Rksd9l+cCqgr3oHx0cncQzy
         G3Xwl5yIVm79rcrbu+82fCiVWacI8wa0+RKi6/zc3cVx3kCtp1iJgnjQ6EduQUwiw6JT
         s7YRczRXk5eAOBP+hpQEJTZSer0Pw7vgqvgIS6LQPiISMEmM8rUP1dmIAHK3GvnvDBlw
         VR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787269037; x=1787873837;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k+xmfX7DA1IMWAYKfjmQ/Aix3ZtqaekUVXRTDYfDjog=;
        b=haAg5tUFRwsHhPNzyXVl2vQjxngmuqEHnf0oZ0plopDVNIH2K4ECnszs5KpGSk1bFL
         LgJuRNIJHm9yrCSSbBbghaObn3B1AajMZQEAfZ0bj4gOzhr2/TEF/1apfFoce0Ec1Na1
         b43HIAfy7YHPXVCaRrSwbnLzh92pXw5JShQULgGh/2yjO6gl50g9sDHD7h3H6Ylwz+7x
         KgqIXhKqE+vX4Po6QWcs98ZisfaDSbC6gkwk4wZfzE9LZpaJVdw3exGljLxJ3vtNZlIN
         8t+iuo9f87L3vfZIUSznj3Z9hOTU+W550e8sSooLnYALir5yroE8+9Fa8ezp3Fh94DKz
         Cidw==
X-Forwarded-Encrypted: i=1; AHgh+RqsBzPMDZ9RqUrUOU+GC3GOR9WMxIFBspNPLB6/azsmSW/rZ/YWQWbLYA/U5392bsIZ/odkSW7Flkk=@lists.infradead.org
X-Gm-Message-State: AFuF++kF4F539jwIehRNF7MENyu8gE6sWowrYQFM/4yQLPcfVYGGoXLB
	3GGMnS9q/nafT+8IvHPYnsqcG70kWWzn5RfF3aNRXLNHt8ftm7FHxQHuXVTQQFMSQw==
X-Gm-Gg: AR+sD11YLXT+TVRF70cXkndQrPTZP4lICZz2g71BoZAs8bH0hAklIV7PMFBi1Cvu3Vj
	vfxBovxXEHJpv3iKN/0HV7TX14wvSbSU9d4AYYvuUqcFxGdFezmUBPh7rdIZARmZA1LzX1r5DNw
	xqP2q/EDRwcx6qY/CtVV8xVBv9mTXjQKQWBAXkyMOnuNCncjjkGP9SbMtEjtArWCdsK41le5iNj
	EFyVjJUTmzw/8HWJx3MCq26j4ySxN4j5fppkrmuWJ1EmQsdJMFMRygs93UJvbSkj20agS/GUOpH
	ZGLUUFhHj01Dy6BfENmqgiTS50zA2RhcQ53NnYdTIc1tEMpvIjgIzjuQXH3G4GjeqDgIePIdZcv
	JdwwgOxZEz2l6sWgZMSl/qtScV9JGI6K+bfEiuccsxQaNOrMvQbJb3Yix+r3vLsAA5ru5FnKOR9
	K3WGRMP9Cy8ZV/SyC5dNsAKc6hLp3ZUYDyCxRNPLmvEX4byeoBJ5YhAYjn3c1GNcJ52/0JZ3Q4d
	oDSsraTgXtvlE35mW4Yt4W2xSPE+0sYnuZ8
X-Received: by 2002:a17:903:40cf:b0:2d3:153d:acae with SMTP id d9443c01a7336-2d64aaf3497mr3577045ad.0.1787269036513;
        Thu, 20 Aug 2026 16:37:16 -0700 (PDT)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c8e2d7e0sm116103a91.0.2026.08.20.16.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 16:37:15 -0700 (PDT)
Date: Thu, 20 Aug 2026 16:37:11 -0700
From: Vipin Sharma <vipinsh@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, pbonzini@redhat.com, borntraeger@linux.ibm.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, anup@brainfault.org, 
	atish.patra@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn, 
	chenhuacai@kernel.org, maz@kernel.org, oliver.upton@linux.dev, ajones@ventanamicro.com
Subject: Re: [PATCH v4 6/9] KVM: selftests: Add various print flags to KVM
 selftest runner
Message-ID: <20260820233637.GE618052.vipinsh@google.com>
References: <20260331194202.1722082-1-vipinsh@google.com>
 <20260331194202.1722082-7-vipinsh@google.com>
 <ampREGtEqKh8_-Ua@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ampREGtEqKh8_-Ua@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_163718_141678_35F16874 
X-CRM114-Status: GOOD (  10.82  )
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

On Wed, Jul 29, 2026 at 12:14:24PM -0700, Sean Christopherson wrote:
> On Tue, Mar 31, 2026, Vipin Sharma wrote:
> > @@ -27,10 +34,14 @@ class TestRunner:
> >          return test
> >  
> >      def _log_result(self, test_result):
> > -        logger.info("*** stdout ***\n" + test_result.stdout)
> > -        logger.info("*** stderr ***\n" + test_result.stderr)
> > -        logger.log(test_result.status,
> > -                   f"[{test_result.status.name}] {test_result.test_path}")
> > +        print_level = self.print_stds.get(test_result.status, "full")
> > +
> > +        if (print_level == "full" or print_level == "stdout"):
> > +            logger.info("*** stdout ***\n" + test_result.stdout)
> 
> IMO, when the print_level is exactly stdout or stderr, the runner shouldn't spit
> out the "*** std{out,err} ***" line, as it's pure noise.  E.g.
> 
>         print("\033[2K", end="\r", flush=True)
>         if (print_level == "full"):
>             logger.info("*** stdout ***\n" + test_result.stdout)
>             logger.info("*** stderr ***\n" + test_result.stderr)
>         elif (print_level == "stdout"):
>             logger.info(test_result.stdout)
>         elif (print_level == "stderr"):
>             logger.info(test_result.stderr)
> 

I agree.


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
