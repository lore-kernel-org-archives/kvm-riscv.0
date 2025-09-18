Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C926CAC59A
	for <kvm-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 14:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=raY4T6x9ys/+TNrK+IIgQAa2vVU7BN8dvyR+ORO8XnI=; b=XbJ9BPDh93ZRVY
	oyZhx/pcL1aX5BL/I9H45hvDK3u39Alrj+QNa9ttF7FLh/q8hakOrX0tWY30W4zaZmNZj16ZggArt
	6iGakxyVWMKdroCyTNakslhCA5Hn06Q1Jz+5SvQkhVmBkdIpHu4peIqD4uyVt/2VXth021+2vvj2J
	OFBY85bGZtqxrQx1uqLxwaR7s8tiDVjK0U/MuN9Q7QEaa1Zy+ilR4EVsm/tPdpmp2NU4FFyyHoyKs
	fQDXm4zr4ayh55DIwh6w3LnvDYDiwfWYx/oFaqITIja/tVCW4J5jvoRqt48DMhQSX1yjpP2ZVUbtr
	tzoT+Y7cTbE/NPJfjhkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFNw-000000004mH-3p1E;
	Thu, 18 Sep 2025 14:13:20 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFNv-000000004lX-0N0z
	for kvm-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 14:13:20 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3fe48646d40so10037405ab.0
        for <kvm-riscv@lists.infradead.org>; Thu, 18 Sep 2025 07:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758204798; x=1758809598; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F1MmCQpl3QPT6vhzyzhZFHhCw4VVs5ngIOZ1UEvQRf8=;
        b=UGbLbe3D6VPh/fjeuJRQmZaD3sVD10oKmifl4Gjhk2uY6GDEKqZRZPB7+ig3I3oBY3
         MhZ+qB0bLREUqUi/zlQGFp+EmS/r9bFiOQRl5GBdg02ZP9xJLsj0T9js1LYoY59w+yw/
         C0HJtTOnnNwEmIVM2tTqSqXjYH6GJlzilpPrx7o/uy57ajiz2ZBAjQWOY4e4OZAZkIAh
         EvViFUncpUBNq6o5wVQaCVzOOE9htSHvV1JipykFUzsus4PShUDctzWWCDtNQM5pIy0m
         yAZWK2x+VbAUCZ8wQEmr4I4KWyfjPHKj1OW1zLjXwcML+o7cAHwZqsQMSheNY8dK6MnU
         ChrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758204798; x=1758809598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1MmCQpl3QPT6vhzyzhZFHhCw4VVs5ngIOZ1UEvQRf8=;
        b=HhvgfWbiNFFOAKUoke5NUZOr3xFVzsaKKftit5j/xhGjk0yxFzHJtazqUI+32SqNmo
         HjwHZGKJw1AWXDLPLJZt9uX5uyonkc0WiytMJZokD89ALCuUFWO2MdVUHnUNI/P72Siy
         rRLuDgB3dI+Pl5FiF+H98iivQjWOaJZvip/ekFfqzP+SSoqRhBQxjmy/NYpIkIXlH22g
         UC8UqGX395oVbdT3V+VaHEvpsPQFBlq/LHB2x2ovzDaOZt4dtMcRHBokpBsr7I3jBcEB
         KZdUQUd1xqorIwQg3DZVSKuIni323QkvLEIUvTtlQxEv1m2HqB7iBxV9pDfmbrFOXZDO
         0rig==
X-Gm-Message-State: AOJu0YwWhxFIafZf0yJoKrDPsIQv1IQX5rq0sl7L5qW3w0EwUeHs1b3A
	73M2aFUqB2Z22FKZMRzCaa3xpeCkT67O0Syq/nzWWhWKB+8oPRplgIYYHZafPpynjvd9xIbh4hU
	za0teVpk=
X-Gm-Gg: ASbGncuXBnBgcBqb5I3NaTqseUWF0IfLKCyZFjXBnB3Scp9v68Pzc5TNYLpcVubTEjh
	rmvYgM/xSQDM4ey4ocRNXwx4dxCpJ0Vrk+cPaopzq6vWGc3xG+cEZFu7eIpFQNxGhlB2DUS/8Wv
	WKo+lfMGTAKbsVHyv/mVy+tK4/9W8VJz3poQi6l8QOmD12Ez42H9WEiLCz2DZ16qXcDZIcPKGke
	u/rXvcrtShOj3g6rHVvn/mnDngs771ebJrGS6M+hYgA+918IuP7D8Buv6QjYQCrgPjX+tZ/o0mN
	vUcYROz7RvHdLHVlTC49dm/fd+jsErunw0YNCM/2hW6Eo7OTtYRLaBFJVJ/oc1ZqEsBJTnKVT+4
	g8vh9FvC1rd+H4kYaTtD9V5PFMkBMzOKJnUNLdpeuGVM=
X-Google-Smtp-Source: AGHT+IG0rdjM5Cl/fPapui7nnoI2GkwZiyv2iUMYNyiDrLQkO/yStLrijlUwKwxB8OtHYuwLC7qqyQ==
X-Received: by 2002:a05:6e02:1aaa:b0:424:2153:76e4 with SMTP id e9e14a558f8ab-424414d1736mr63206925ab.4.1758204796581;
        Thu, 18 Sep 2025 07:13:16 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d3b015dd8sm973887173.13.2025.09.18.07.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 07:13:16 -0700 (PDT)
Date: Thu, 18 Sep 2025 09:13:14 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: wu.fei9@sanechips.com.cn
Cc: kvm-riscv@lists.infradead.org
Subject: Re: KVM: riscv: selftests: sv39 support =?utf-8?B?bmVlZGVkP8Kg?=
Message-ID: <20250918-618ded295b364b5aee7d17b2@orel>
References: <202509170234.58H2YCma081344@mse-fl2.zte.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202509170234.58H2YCma081344@mse-fl2.zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_071319_130766_D3309400 
X-CRM114-Status: GOOD (  11.91  )
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

On Wed, Sep 17, 2025 at 10:11:05AM +0800, wu.fei9@sanechips.com.cn wrote:
> I was running kvm selftests on qemu-system-riscv64 with "-cpu rva23s64", which
> uses sv39 by default, then I got the following error. After some debugging I
> found sv39 is not supported for selftests, should we add sv39 support? I can
> prepare a patch if it's needed.

Yes, please.

> 
> # ./arch_timer
> Random seed: 0x6b8b4567
> ==== Test Assertion Failure ====
>   arch_timer.c:73: false
>   pid=144 tid=146 errno=0 - Success

We can avoid errors for the default case by adding a
kvm_selftest_arch_init() function for riscv which calls
guest_modes_append_default(). We'll also need to modify
guest_modes_append_default() to configure the default using information
from KVM that can be obtained with a get-one-reg of the satp_mode config
register. OIOW, use satp_mode but otherwise just mimic arm64's setup.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
