Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEEFCC3600B
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 21:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IDOQLfcZ2scaqTQZuz7i9rIk36WHe8KKg+dUB2nhIyk=; b=JM/1Pm9u0nhHco
	FBZAxzhSDtf6lQ98ZM1GDa0kyybX56cMeLz5gZetd/QusLyt5uzIjYxKLArbBB1P4YgRZ6QQI520j
	f3mtsJRvCDDyIWG0hx0QNMtakCRAXMOfrutdXyc/v29DHrGgzwaVRhTTxqPLfo3B+mL2p7GgWbXy2
	gPV59aONmiVfpW6tK16nY80z036Rp1MAvaR0EJFRYmC3gWaxcK/f2KrKdYcHmSz4MKQ4ywWB8qfMb
	WPFZIJTImj2ecASwmuasYhSHNRCO/R2W1FmhCsyDf+uUEJJgWhHuPruBWv62nSLpoHavzH9rH5Ofq
	1jd3SMnvDwkMJXwgAXLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txuQv-0000000C20S-1cmC;
	Thu, 27 Mar 2025 21:06:37 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txuQs-0000000C1yv-231m;
	Thu, 27 Mar 2025 21:06:35 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so8144005e9.1;
        Thu, 27 Mar 2025 14:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743109592; x=1743714392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JFrrEKOtsin+8uVvD5v18PtpdZsRPpaDruCArBuJl1k=;
        b=WqUw9qDK1G4wEJstxoecDV5CLcfxgjFbg5Mht3o1f5kXQoMc6DRl3kaXNiTV6lr4xZ
         hldW/Qa5vc+JmUXbBNZRQ9fA4DNeXfr9K4bnDyZs05itw08MAR6O2750qv1UeX01yQuS
         fE7FIKLZJwzMcgbQ3q538qpV5ZUl9+BNeVxSYLQwfJLQGhmSotJiH66X1XBhP+CLo9PH
         cTHWPpOhs3ae3XiBkHk3lGdnn8+elLDxEQnjj54ZWpuLK4GZ3ipPno516wb7IBT//QWj
         U/2L8VPYlQd6l66tcFNEu78VtpTrQ3oXmuk32kwGxeXohxFR03JgCdfTHJK9Do2UQoSl
         rSWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743109592; x=1743714392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JFrrEKOtsin+8uVvD5v18PtpdZsRPpaDruCArBuJl1k=;
        b=CiPzy2ERCTO9zaXRUrKDJ/eERox+dNRe+ky9GMwjz81u0EBYY/hmxOydvP/LEzy5EY
         DPQxdyVglhA5WXjRVEI53s8rYLX0F9JRZtmp7OgnXD6RfUD5e0Jnf33E/PjOQOKjhIlX
         DEojlz6cDJsSI+8hnYbiYzdneTEdxhcXiNUSi8TmcgjA1z45Cg2wXIHssvQ/iJeKgK2E
         T5R7qJX8zWM5AuNAIuaedvDnMP6oi4JU6yHL/EEwSQsg4leGEAp7iGFlAjqaEx8gsIDq
         7+RughIRfBK69l7XVRb0soo6UvI2+PgW6gddRmFdSOJJ+QFDV7i4IMfH97W5ccuBm0W6
         aEDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgCp2gPOcduIPAz7a2HEeLiX4ob+IMFNTARb9weHm7hmr1s29siS6ZRRrVZvIh6+d9buROs3jHJLX2Tw==@lists.infradead.org, AJvYcCWWIm46b0v3jnL+S3u4vkFdlhtxyAmkXglEOlPaxG2O25mASlVkHA75TPT/LYv4YXW5Chol5OwBqLlO9JU=@lists.infradead.org, AJvYcCXS46L9YN5joxfyW49h1PEFNqwo/t6P+tGjHgI/y5ek+grrdO2PPrWRgtSzGZu1TVkNq7lYRSEHZlA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzCG2wkRSuh0mrQ6jhWpAqzJVSZm876cpewMXsELjFjI0p6PY/y
	Daj6xrrvQvE5eOcsk5bN+i17RNsxBoyqPykNmWfJobTPaLrIQ1IG
X-Gm-Gg: ASbGncsjfI+nAGcxSVNDzTzVJ8llesemV9qG3zv8Xgo3MUacKzQVSzZ7CSBjjWeiCkB
	QX7SKavVduyjBNYd7ilo2e200RWBRCFfF+AUXRKTp/jPahX6m7W2zbYF954X6gAYl5qe7IQlUGI
	ys6VEAI1PkClRnOXm18mD6iISDquWaOGTRMFUtc2rLiCHWQZunfbY4SMpV/3503KuTSyaBaym4S
	vaPBVwxqk25gAUrWTUq0LvrMIH1YUmQPO5OK9HqD9aNMHuZ+W07MlnUmhzuKURaU9d45jXM2G6C
	cwpee1nHul9JeUDo/sCNWa7GBCB5gTWv7STr9rPQ3vhuzGG+QaeZ8ERps4mdj1u/Tv29+HdMaOg
	CmVFFZT0=
X-Google-Smtp-Source: AGHT+IF3JVFu2jCYFxmmspP8DgX1SusdSEIsW7Os+9zvssuS6MfQig2v8nl6xgtDIG4B7nUqszDWww==
X-Received: by 2002:a05:600c:4e05:b0:43d:26e3:f2f6 with SMTP id 5b1f17b1804b1-43d84f5e5bcmr60988395e9.5.1743109592161;
        Thu, 27 Mar 2025 14:06:32 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82dedc2dsm49307315e9.2.2025.03.27.14.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 14:06:31 -0700 (PDT)
Date: Thu, 27 Mar 2025 21:06:25 +0000
From: David Laight <david.laight.linux@gmail.com>
To: guoren@kernel.org
Cc: arnd@arndb.de, gregkh@linuxfoundation.org,
 torvalds@linux-foundation.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
 oleg@redhat.com, kees@kernel.org, tglx@linutronix.de, will@kernel.org,
 mark.rutland@arm.com, brauner@kernel.org, akpm@linux-foundation.org,
 rostedt@goodmis.org, edumazet@google.com, unicorn_wang@outlook.com,
 inochiama@outlook.com, gaohan@iscas.ac.cn, shihua@iscas.ac.cn,
 jiawei@iscas.ac.cn, wuwei2016@iscas.ac.cn, drew@pdp7.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, ctsai390@andestech.com,
 wefu@redhat.com, kuba@kernel.org, pabeni@redhat.com, josef@toxicpanda.com,
 dsterba@suse.com, mingo@redhat.com, peterz@infradead.org,
 boqun.feng@gmail.com, xiao.w.wang@intel.com, qingfang.deng@siflower.com.cn,
 leobras@redhat.com, jszhang@kernel.org, conor.dooley@microchip.com,
 samuel.holland@sifive.com, yongxuan.wang@sifive.com,
 luxu.kernel@bytedance.com, david@redhat.com, ruanjinjie@huawei.com,
 cuiyunhui@bytedance.com, wangkefeng.wang@huawei.com, qiaozhe@iscas.ac.cn,
 ardb@kernel.org, ast@kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-mm@kvack.org,
 linux-crypto@vger.kernel.org, bpf@vger.kernel.org,
 linux-input@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-arch@vger.kernel.org, maple-tree@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-atm-general@lists.sourceforge.net, linux-btrfs@vger.kernel.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 linux-nfs@vger.kernel.org, linux-sctp@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [RFC PATCH V3 00/43] rv64ilp32_abi: Build CONFIG_64BIT
 kernel-self with ILP32 ABI
Message-ID: <20250327210625.7a3021d0@pumpkin>
In-Reply-To: <20250325121624.523258-1-guoren@kernel.org>
References: <20250325121624.523258-1-guoren@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_140634_529310_4ECCFF56 
X-CRM114-Status: GOOD (  12.01  )
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

On Tue, 25 Mar 2025 08:15:41 -0400
guoren@kernel.org wrote:

> From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>
> 
> Since 2001, the CONFIG_64BIT kernel has been built with the LP64 ABI,
> but this patchset allows the CONFIG_64BIT kernel to use an ILP32 ABI
> for construction to reduce cache & memory footprint (Compared to
> kernel-lp64-abi, kernel-rv64ilp32-abi decreased the used memory by
> about 20%, as shown in "free -h" in the following demo.)
...

Why on earth would you want to run a 64bit application on a 32bit kernel.
IIRC the main justification for 64bit was to get a larger address space.

Now you might want to compile a 32bit (ILP32) system that actually
runs in 64bit mode (c/f x32) so that 64bit maths (long long) is
more efficient - but that is a different issue.
(I suspect you'd need to change the process switch code to save
all 64bits of the registers - but maybe not much else??)

	David

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
