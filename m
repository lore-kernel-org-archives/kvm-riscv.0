Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42662CAC5B8
	for <kvm-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 22:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PLM/+gdAWewTb2hIigDtw+pRcMsPF4Kp1VYzTl3Ye3s=; b=HZzTJetRfeI5jc
	okD8phvsWxnW6Rixre1cZ9BSWhqbr96HQ/9JId1drxIJiEP8lLlXjfwySRplzL+NIDZEyk+7yn0I1
	RjapRFH4vYDr2Iqn8tWLLTYZDeS0cZyo0v7QhKdS/t6p6BY4lMNjBl4HNgNCl75+KtgtLgsNSkPEV
	cHMeIAsmBZ2BJaVohj+0SWfGHfW48f+2VRUZFdzabVUUx0pX1jMAUrxzwbeTKz74o/vh3NzGAOQCt
	KKOteMhoYfKvRe5ofYh8xADkIVw/2nZBArQFrfylPQaRRzW7RPrXk+AjilB5JutU3/kVN1qh3hvsO
	3NcX5B0FEzGjgDMMj42g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ilJ-00000006JOa-3gUd;
	Tue, 30 Sep 2025 22:23:57 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ilH-00000006JOC-1LdJ
	for kvm-riscv@lists.infradead.org;
	Tue, 30 Sep 2025 22:23:56 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2681645b7b6so23825ad.1
        for <kvm-riscv@lists.infradead.org>; Tue, 30 Sep 2025 15:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759271034; x=1759875834; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OovWlEA9+Pzbq4UuSlKiI00VjEkZNQJKGvfeEXc2tY4=;
        b=4x9HBM/7cIZtHwvithwhDQmODlrNU7/NZPaDoW1dZgmoBO8EdCyNYQ4njhK+r0oLcA
         ApzRmLKVxoN/eox8uhVItqjoXBFdX3lmEYMFgPEDIkjcu7eFT4f/zmCtoTISzz06iY2R
         8pTLVPugSGttxyFOeo/3u5MO1xmPNhznJJX1PABPZvJT8an4rgdfv+7szdyWse5evSiF
         lTW9K9StkAF/Grq64/adUq+5IXdAH0pwY7C/PRURK0KcK765aK1haBqJJlrG37gZNoes
         wCds9HQ0D+Cie5tH3A2yammbAyXLn8cCgRhYpbKAqNTl2nX/RQFwH95ssq1Ce7DLxSXm
         T0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759271034; x=1759875834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OovWlEA9+Pzbq4UuSlKiI00VjEkZNQJKGvfeEXc2tY4=;
        b=ENRnPnQgbfYPC4Ummw1huymYV+lwfhm/YNLFBjynEZptQKDoz1lWfA8jzmhoIdl/Hx
         mlSogRzAKdgR0gMhrjHizdJV6HoFc9/JznM8IKaLnQfPiuxRVC5CvHeFQ6g7swcoJuL/
         ORLAuO1lrjyrvIbbbLugtIlPl61BQMsrZ9hBFUWsiES7tqM1PzNHtDVn8XPgwHvYgkLL
         aq1OU4W5LHaYMWpeqFQgFs+wPQgIAXBcxRg/5gALMuLwBu6VSkKanUR/FmbH9hUMeASI
         RwHsV/KS7o1K1EPnyj0mcLgfXRBsSOfABqVVz3phLJWd2DP9QlFGY3d3T5HWBrloQtmD
         asGA==
X-Forwarded-Encrypted: i=1; AJvYcCX8MZ3PTVmpXa3OGsd+rD9I/vp38RWXqf0zPH9SXLa4uz8Ji+4y44nGkbG7YvGNsvyfHa8H4rdPOOI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwpMhYc3/Z6RSuq4+DHaz6xb+9lprR48AOd3TEnwJxVzFFHGwbe
	hXnlXEiAYD098g1ErXqBAXTPiaXGmmdeNXbZ3ViSbNZ3NQPKxmvKmks8l+WmTDHP6A==
X-Gm-Gg: ASbGnctqY3ZUMFXEInI3RyN6btOrwoIfFdwbADAYFXzAt4vUhxgAMIHCddoTWvXNkZN
	oPMxNxixKfWwfwZxW7stLe6Ql9JqHhffMGTG4XRNAAxJnizLKOBpQXl0ALctbPFaHE0YBYprOZ2
	k0EBgHa/ahVpyhx2rODsWTZiCCRXRed/I2NwN7fePFexKRov9O+smYn0kaccpK8BkIneZVNa85F
	D1f+iGvjV1OGVHwaaGQ6KlgMytRK3M5ZxZiKiozY7uRy4IAfCi92R7wbZSH4Zbcbdim/lYGtre9
	Rf815emIEielO4pebeEPKKnmhXysBq06uCjqu/BTHPFILPrEO1v41CEieAbthL7KPfLFeqIyREL
	il8Frrdcpyrb7sQ8buERFgWce82xqSBRV2PdqmV0QXmrQEqWPxd2YXmgwldQaUtxa8CG4Cnc43V
	MYmEudXeZqXDpaSU65K+cz4A==
X-Google-Smtp-Source: AGHT+IG7yXqqtZNgHXq2ux/pq6R5lOByc3Up0+c+fpGZ9ajcwT8arb5aAkRLhIVwYDowJVib6njbyQ==
X-Received: by 2002:a17:903:1b67:b0:274:506d:7fea with SMTP id d9443c01a7336-28e8127b0c3mr707745ad.5.1759271033336;
        Tue, 30 Sep 2025 15:23:53 -0700 (PDT)
Received: from google.com (60.89.247.35.bc.googleusercontent.com. [35.247.89.60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ab67a9sm167075335ad.131.2025.09.30.15.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 15:23:52 -0700 (PDT)
Date: Tue, 30 Sep 2025 15:23:48 -0700
From: Vipin Sharma <vipinsh@google.com>
To: seanjc@google.com
Cc: pbonzini@redhat.com, borntraeger@linux.ibm.com, frankja@linux.ibm.com,
	imbrenda@linux.ibm.com, anup@brainfault.org, atish.patra@linux.dev,
	zhaotianrui@loongson.cn, maobibo@loongson.cn, chenhuacai@kernel.org,
	maz@kernel.org, oliver.upton@linux.dev, ajones@ventanamicro.com,
	kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/9] KVM: selftest: Create KVM selftest runner
Message-ID: <20250930222348.GA16152.vipinsh@google.com>
References: <20250930163635.4035866-1-vipinsh@google.com>
 <20250930163635.4035866-2-vipinsh@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250930163635.4035866-2-vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_152355_360879_C569E501 
X-CRM114-Status: GOOD (  11.43  )
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

On 2025-09-30 09:36:27, Vipin Sharma wrote:
> diff --git a/tools/testing/selftests/kvm/runner/__main__.py b/tools/testing/selftests/kvm/runner/__main__.py
> new file mode 100644
> index 000000000000..8d1a78450e41
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/runner/__main__.py
> +def main():
> +    args = cli()
> +    setup_logging()
> +    testcases = fetch_testcases(args)
> +    return TestRunner(testcases).start()
> +
> +
> +if __name__ == "__main__":
> +    sys.exit(main())

Sean, as discussed offline, following diff adds a minimum python version
check. Runner can run on python 3.6, it might go lower but I haven't checked.
Linux kernel minimum requirement for python is 3.9
(Documentation/process/changes.rst)

diff --git a/tools/testing/selftests/kvm/runner/__main__.py b/tools/testing/selftests/kvm/runner/__main__.py
index 8d1a78450e41..db87f426331d 100644
--- a/tools/testing/selftests/kvm/runner/__main__.py
+++ b/tools/testing/selftests/kvm/runner/__main__.py
@@ -91,4 +91,9 @@ def main():


 if __name__ == "__main__":
+    PYTHON_VERSION = (3, 6)
+    if sys.version_info < PYTHON_VERSION:
+        print(f"Minimum required python version {PYTHON_VERSION}, found {sys.version}")
+        sys.exit(1)
+
     sys.exit(main())

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
