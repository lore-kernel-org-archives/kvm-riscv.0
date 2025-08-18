Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00399CA0EE4
	for <kvm-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 21:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ajhGTZGHwoDMIzw/4+ZfbVua0kxBRZJ2WZHEHnBdS2Q=; b=EnAf2wTz0gWnqs
	JN845PQzV7oqiAcFQ73HSbRkF0d9ItKbzlNlIY9Qf6hZtKBHEjooTs0qZ9SKL0bhUD/IA4b9H9mzy
	YbcYfYurJNPoLjw6uwdZf9M3N7cfE92RnBll9wktzNuKlvyFoiSe6ZDyVZDOXArcU6EDBdcgYQcZD
	Lf2b1iVu2icQTIF3OuC6fmGFmm8oxRzzddfh1QbK6Rg0Mos8YOOVX2dRAsjaPxxdjOAbrtautOGWW
	dJye83/sqqu6bIJfG4MfKFsS0EugNW898mG3vw0yFQtlGUshx9/PfvIP6Nk9NL4OGU0AxVR5NynbO
	Nyp1QemQ2L20o/QhjZgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo7OW-00000008j1a-2ySJ;
	Mon, 18 Aug 2025 21:27:56 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo6We-00000008dPV-0im2
	for kvm-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 20:32:17 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3e6666a4f55so23311365ab.3
        for <kvm-riscv@lists.infradead.org>; Mon, 18 Aug 2025 13:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755549135; x=1756153935; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Vn7KGvnJ31CxElASYk+NIfs2sarLTulRtjwYt6vxT8=;
        b=Bd971oTwJmkRS4FygEwn/JfgP/YKIvvx/XdQv//+jLXLrTchNlqTaBeylgjZPKO1m/
         FB9MCj3A6iOOObtGGuxeKMRO0KSsnNkJyanK3DnQAjlFjgD5vM16n5ZOfkkbKb6U7Z9J
         u6r2/7d5B/vQ424jwZHWcBVrzfA6SGb8nNaOZ6sYGOIACxNmkLmrICEZ69LAcjnkLpJb
         6ohJsRoVaZHsnOeXup8mNRN63OE3k/87oSxlYNw6/xXXNAUCQNfgNXtogNT6DrmKwxgz
         5sYxIWlViMpto3RtRyXcZZAGZ3TdYV4cAp3CdU3EeR/vu3vxawS66AwZB6Qw01iQ44LW
         N1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755549135; x=1756153935;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Vn7KGvnJ31CxElASYk+NIfs2sarLTulRtjwYt6vxT8=;
        b=DwNLRO463ywxwFJfvV10XJwcYJr8Jcbo8f4+CuZnGD8pAUzLBMiSN9jWtXBI23R8sv
         MNgdDQwyE2hrnYqbPC1acvu2TBLnce6JZjd2IzxGUQlloNO19sAwT0ckT6jMEYR6CVEE
         qXa0dG0XPZUw6sYcsE9EPUAZGAmzGOr2KtW3YrbT8wUsF1M8BSocs/sxE9EECaMzQAeH
         A+JEvEm6HO5vqVByBK58qqciWM3UfKBL3wu64F+wvqci+M4Ya4zeJkvvYcIBmAenUlMg
         yS4WGZlc0qgv25efxJuTB/YF3I+ClbMclJsLizvFhpT9DGc3MphitrebClRREjAhMBBB
         eCig==
X-Forwarded-Encrypted: i=1; AJvYcCWDSu6EMq/9m7pcS6CsbqUzByvSI/++V9TqGFNPJu1HXZhRyXeZ/RHQlca0azQ3YSWTtNlpJhoU8dw=@lists.infradead.org
X-Gm-Message-State: AOJu0YztXulde3au9UJ8Foa0gTE+6qgnQcEXicnehtTxaY06n+GHeJB/
	tw5+5R6AMmhIPxAkJCGiOnQ8DsDon/Yhk+EsQQQMaNc9ycxgJ4aHtcSJhxgPGQfeo4w=
X-Gm-Gg: ASbGncvBmhAvjIrRew89RWwKYPJLsKZE7poe7oBf707HxL6uWuOPoqWsInwKx/EOYMN
	raDgoZxkIN/ws1Z+3Q/rteo8sY/EjS4kijhjjcmGtvKG/ntz2408gyGkFFagmDpW1hUqzTtcMWo
	sZonTWESYJ35clRidVGgdva3oIl8GSN19ZQw6gVzuLxbuKry9kxD5CPpYYv73aYSkTMZny6wFuv
	YMJC/THgWbpEPw7BE3qv6zSRmyPlIVD2v7V0kvi7RPibxO4c+vC+MrFK5TLT5refybX17jJqxkb
	Gvmh/IsX9c6I7fKK/x62/GuYEODFBnk3tIXk0ovb2vGnaGhrKC6qFtHay4sdiNcvHeH0BRXvKH+
	Ri3Xo8TD5jBMDNGszp22HcqoJ
X-Google-Smtp-Source: AGHT+IF/UJeN6VdS70sUHdd0WRTBcf8Mub8fIKvWwcAVcgm38V3gFnMMkeNmKxZ5+rkOte8i+tJYLQ==
X-Received: by 2002:a92:ca4f:0:b0:3e5:1917:585b with SMTP id e9e14a558f8ab-3e676638e2cmr1709575ab.14.1755549135023;
        Mon, 18 Aug 2025 13:32:15 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e66c6b0b12sm13085315ab.25.2025.08.18.13.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 13:32:14 -0700 (PDT)
Date: Mon, 18 Aug 2025 15:32:13 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: zhouquan@iscas.ac.cn
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/6] RISC-V: KVM: Change zicbom/zicboz block size to
 depend on the host isa
Message-ID: <20250818-f6b7d56c16a41351e90ca804@orel>
References: <cover.1754646071.git.zhouquan@iscas.ac.cn>
 <fef5907425455ecd41b224e0093f1b6bc4067138.1754646071.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fef5907425455ecd41b224e0093f1b6bc4067138.1754646071.git.zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_133216_219651_047D5E4E 
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

On Fri, Aug 08, 2025 at 06:18:21PM +0800, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> The zicbom/zicboz block size registers should depend on the host's isa,
> the reason is that we otherwise create an ioctl order dependency on the VMM.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  arch/riscv/kvm/vcpu_onereg.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
