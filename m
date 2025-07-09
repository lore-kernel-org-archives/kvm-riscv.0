Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7068C83F10
	for <kvm-riscv@archiver.kernel.org>; Wed,  9 Jul 2025 22:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=NR0HXAfUmjJBlyGS65sAJm/VSzjR1X6t4fq1MLmllF4=; b=yDOTze8rQDeoUJbuWqxLETBvsn
	3QefUQIhoQMZ3LgvFbFjkKWFSAEO+t0v5JI/O2qbW/oduLbvNIN1ExwvtPqyW03SxSyTNzR9wVQ4q
	Fd3LZYElNos1HUA7CPSZUMQ7ir8/6NAUOjh9EtkLeIJ+ksrfdPKqmndpM3kJHJtUMvDYbhYUe2Ayb
	2EE6ZUp5BC/2zTzCy5Y4bXPAq1ajmUS9dN20Vb9pgoVPS9IOZb5G4OFdCvbcZCSWq41bKYt+S1UFT
	JAEvSIOvRyRMGwqfOIjzQ+mbFaQ4v5RjspSM3zCblAJvEO3FvC/QliV/1/vrA77MgdKQs6Egu+EgN
	aXchVl2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdkB-0000000ABvv-3TME;
	Wed, 09 Jul 2025 22:58:27 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdEc-0000000A5Oy-32F6
	for kvm-riscv@lists.infradead.org;
	Wed, 09 Jul 2025 22:25:51 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b3ba7659210so231622a12.2
        for <kvm-riscv@lists.infradead.org>; Wed, 09 Jul 2025 15:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752099949; x=1752704749; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CEkPKw3M8obzlysqjDzuJ0l8ChAy9EN0Uu/m/zS8TW4=;
        b=KyvGM5P4Kn9u220Mk098/e6j5iF4wQ20ZSJMpNIpoZ2aiPJMIbCygigJmY8JSwY+G4
         9RLQGRshCA0NmUw1xXpLgAa0qelsQLIMVa8BlatHdQgKDLlqZBo389EI+f/gvGHBKs4P
         WrEZswI0QKyCRQ35UNGYACugQe4UEK+qgY91fnn75znpa7eAWhGv+QHZqN9t5Zdc2LO/
         kGGsMkr2zeoO2n3x9jdDUAQnWl79ffmkunoyCCmxP+WqX24vPJK15b32PQWqoRNw27hT
         BXifGwh+EG2FDpu9vpHHiipi4uFiMlBZSpXccWkAm03pPQW0Vxpm4+0WjYtLjuQRq1rc
         F7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752099949; x=1752704749;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CEkPKw3M8obzlysqjDzuJ0l8ChAy9EN0Uu/m/zS8TW4=;
        b=dVGEVS8QVHpEd8wZqgq+DmO8VrCJQlOg91e1zKa+vjfey1lft6OByK3q3iO+cnS3U7
         8B2JVBpliQEO6H5SJ3AfYkuvnq5xJOXc59yYGoEMHzonMDkrtbN/jhTNFC3/bj9z/RmU
         6297Gf9k5h0SQIhKnDfr5rZdS6KRx3MizjTyc33nUx2Z6BU1k6S2gZFGLx2QGm1iWzsE
         uk8dXEHs1WvIpPx3D9rZChKFFWyvEjOSwmilFrhcgSCYPEW1l6dBGiB+iL+G4meglpsV
         CK2tCasoRSSKZhcnl3538k3xr9TKdZk4KJxVfgkOXzr9vjiacmqVt1e5LL6q7/AYBsoB
         3qVw==
X-Forwarded-Encrypted: i=1; AJvYcCUfTJ8iq8F2B+E65Bj0mLglIdW2lyHcvNIiAc7eSv+KRAbz3b6+LjTTGmoV5qT/5KZfqP7nGMdrYdQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7vZM13JnwCueDXo8s6JQSsazXt3JzFe4B4ni6E8uudttzlNmz
	KfO6l4/jgBWPI7imiJlT5mYyGRkbVlHdegJTtJmN02phuxofgoAfBfk2talDsHwecyMEyAv0SpQ
	BTTJaMA==
X-Google-Smtp-Source: AGHT+IHzaFg8XpZkeBot1MQe7M9Yb3LfWilFjWjxq3XfLXBIK/XNa5kNoc+2CdqHT487bCXwnmwMfiMG/dk=
X-Received: from pgjr1.prod.google.com ([2002:a63:ec41:0:b0:b31:e758:d80])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:502:b0:1f5:6e00:14db
 with SMTP id adf61e73a8af0-230040e3516mr508970637.14.1752099949457; Wed, 09
 Jul 2025 15:25:49 -0700 (PDT)
Date: Wed, 9 Jul 2025 15:25:47 -0700
In-Reply-To: <20250606235619.1841595-4-vipinsh@google.com>
Mime-Version: 1.0
References: <20250606235619.1841595-1-vipinsh@google.com> <20250606235619.1841595-4-vipinsh@google.com>
Message-ID: <aG7sa2fju7noUS8L@google.com>
Subject: Re: [PATCH v2 03/15] KVM: selftests: Add timeout option in selftests runner
From: Sean Christopherson <seanjc@google.com>
To: Vipin Sharma <vipinsh@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, pbonzini@redhat.com, 
	anup@brainfault.org, borntraeger@linux.ibm.com, frankja@linux.ibm.com, 
	imbrenda@linux.ibm.com, maz@kernel.org, oliver.upton@linux.dev, 
	dmatlack@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_152550_761931_F348A76A 
X-CRM114-Status: UNSURE (   8.36  )
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

On Fri, Jun 06, 2025, Vipin Sharma wrote:
> @@ -48,10 +50,13 @@ class Selftest:
>              self.stderr = "File doesn't exists."
>              return
>  
> -        ret, self.stdout, self.stderr = self.command.run()
> -        if ret == 0:
> -            self.status = SelftestStatus.PASSED
> -        elif ret == 4:
> -            self.status = SelftestStatus.SKIPPED
> -        else:
> -            self.status = SelftestStatus.FAILED
> +        try:
> +            ret, self.stdout, self.stderr = self.command.run()
> +            if ret == 0:
> +                self.status = SelftestStatus.PASSED
> +            elif ret == 4:
> +                self.status = SelftestStatus.SKIPPED
> +            else:
> +                self.status = SelftestStatus.FAILED
> +        except subprocess.TimeoutExpired as e:
> +            self.status = SelftestStatus.TIMED_OUT

This needs to grab stderr and stdout from "e", otherwise there's never any output
to the console for timeouts.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
