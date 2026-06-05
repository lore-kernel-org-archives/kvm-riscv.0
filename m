Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E0CCD6E7D
	for <kvm-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 15:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LIpnChgC3psYhH4LafdUKwRK1cxmYXK8514rkJ4mWc0=; b=oa412Cp+pZ/cZ4
	me98voZ9ddOOgyhH14zq0ThgtRB5RJXkttV+rU8Ol+ikFO30Xw7Lf5HGxoy2ezZCG4KJZtJgxS0iJ
	wNyuAIX8/VqP9NHDtK06ffzvvq2oO1WFxZedPR7/8EqPXVQb78OROILhe1lmSpPPye4AsoOCR3mLm
	y21BMb3Y5a9catTROGDRkk5cpwd+SbiCfK/YG7C54DSguUD27vheWii5dl2vwBXFbn9crQ49XonGG
	nEjQURmJMLDt41CB2/hpo0ISO5Z0d8bb3CW37z/i2rbVlLeqbBf4ApEN4sXpg7HLxQwGZgQyc1EYO
	WwiEDm1gzAH3ODx9sIfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVWVn-00000000pDM-25G6;
	Fri, 05 Jun 2026 15:31:07 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVWVl-00000000pCb-1sjs
	for kvm-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 15:31:06 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-69e67e90ac4so638143eaf.0
        for <kvm-riscv@lists.infradead.org>; Fri, 05 Jun 2026 08:31:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780673464; cv=none;
        d=google.com; s=arc-20240605;
        b=GwV35Xg3ncSeBb2vWU1z5MwfffTIcdxrgvQR71XhZGKI2nCxZ8KMR0TL78iVEeWAFO
         BicQVmbHppjXBO+UkKG2XytVbRaikkguCvbwtecS1vDhNtb546n8r01vQeOV8kBHb7SJ
         3myGHY62O6eIxicI08nHbe+BVaRrcSH1PFdbhnkLfQ0gxie1ii0ZbLlylAHtTsoLSI1v
         mwyqrBeSGvL9iJt4DuU5Q8gm8xQ473vnuubwycpfu+Yth17/s0EyX6RbUEMrnOwzzoUE
         eEqDQg5jZCm/KiKc0bqT15M6UUmxUoBEG0bt6YQc6v+qtV05/kiR0Ge9YH5NLK++G+0f
         WbpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yLv7V9PhIjsPqwrVWbCtbGOYDdOFpGh6+/cNhdyXtio=;
        fh=T/NtSxzf0h5He0J2Y04E179mVNnY1sxblpaU1M4NYMU=;
        b=QDhQJvCgbrHdzL2y0RD5xR7hz9pbmblDYjpEbVJTPBTzKgLIDrKXfM7O7bDchp58yw
         90vDAGXMVuBEXTdLyffPQIE15DCw2JnE5S4SB56CP/5/e4fMNQUxe3WCeOgb5ykjeQ+l
         vjXQ8pGG03bCBmd9zoBTg5el61O8YtYB6AX9lqr+GfP022SPnO7UOVfJm1XFJ6On/tj0
         QYxswWDpR9Z68TPz1b3wDm5WjjGEJqKRSmoX23HFOK2BPz9KDeQK+etgeEil+ekcaZFx
         VgA4Y0KwkPEy5U3vb1822Bo+fL2Uev48Q3/dCR5cGacE7pO6CQI64ZS9gbfIsS0p7amO
         D+Tg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780673464; x=1781278264; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLv7V9PhIjsPqwrVWbCtbGOYDdOFpGh6+/cNhdyXtio=;
        b=HsMHkm6/+qUt4DBp1tlvhlTKGDRG56hXUEsC9mrkMq5C/J2F22Fu0izBNN/sRBIID/
         HBhDns2ZVGO0DpH2rHd0e0Unr3kFSuFH49EoST/xyaTY1Y416teMWSnKhHpgOYgHQSbW
         P+QZQSW/i/ilN6lSvZjEd6fWKc4HtO84gKvS3sQABB5vMnF4rdHxnxUsTZwK8WpR9/Zs
         I3PM4R4WXjtycOLaMaXEPC8dzYWdVX2K9FD7EKqSboh7XwGEDhYN5VTuhLlr1wZzvdqm
         e9KutWNzfP4K2m5PNIhKQhqslFbO7Y4AqKMLAfsDa+JIvJWyyvqZ31qhFS6Aw5N3hZbM
         uFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780673464; x=1781278264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yLv7V9PhIjsPqwrVWbCtbGOYDdOFpGh6+/cNhdyXtio=;
        b=N2gMFIevL1rSfyXwfN8Z4aU+DU0/vhEz5zETZka+QTMbRdI0q9FS3cj6mL5JxJNsgb
         nnpu5XYJKV6a7uFfPCnEJZIWOujAEcrIqW8+z8Z5SAhziiuD2GqAereMPiQfclHh0UjO
         cmClHkqmd88OT9s9cf1MVX+EALhfF9KZ1pIxxxk8nNx/MDS3xO3RC8AODECMD+e6/KRp
         ocKXwk0+U54EvDyVvs7SKXq4AouEchxj0oAsVbQkr1z6/SvPoT1QRChoiipTknje3VXD
         rmuvsc/jH5cPv7/a/xULrClxxhe03I8x0RRmYNjZ090jTXxjM2o8AZr2pP/WquMaCqVl
         B94A==
X-Forwarded-Encrypted: i=1; AFNElJ9rMcfqI1NWyOVqFT5JGJbQNiWQI4li79gmZkDgOx61pG1CzB6e6SWSndxEey6hjMnDWQdwOR2DJ50=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7+Jbre9Sl0bKPtdSHhmKQYw4mP6zp20leB3cjSOKubmHObYjA
	jVe57A+W+D5WtMxJQDZ4eX0WR+Fib6uP9xtBve4lSRiA9I5JLKAaVntkQoJEzmcDMjK+CuOPgG6
	OHpqORLvaVwxg2OhUXCreoQgE2aDVc2Uoa8stf6xL/g==
X-Gm-Gg: Acq92OGYpq3mixU4Uv7g8zAJs9N+Jc24W4lukyh9MkAh0PK++WM6EGDx6kfr5H3Bs2W
	jsLxyqsvVmo5vp/pmz/P8YojJwv0DWr6eT0sgWrvmdOIufuQEkFAxlg1f7U5IdK0KvQljSap5oy
	Nl8CEoAcQEPDM71gNVPCksSjdt9F5trUYxLnIjP+s1yPvOFxr2D01zSk8ta+Lp/9wZiB635iL7a
	7WYtekNXO6h4Lqk6p1dEH2VO0+PsQ9qgQfVs9HZzQJ3VDTHjkT9GunHCd8Z2KxbtCEbXJNWfGqB
	ql1zPv60hb6Xjt3DLeTA7qRDGTbsEjvzwjHtYYapo6BWiLvrzAg5OqTFCs/hNGkG9g4hLELXGtR
	FXIfbraAlrBTXYFLF0QsSWaaPRR9zOxodZFRq
X-Received: by 2002:a05:6820:570a:10b0:69e:7061:1ad7 with SMTP id
 006d021491bc7-69e7061218amr765816eaf.11.1780673464357; Fri, 05 Jun 2026
 08:31:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260601-kvm-get_reg_list-v2-v5-0-415d08a2813b@sifive.com> <20260601-kvm-get_reg_list-v2-v5-1-415d08a2813b@sifive.com>
In-Reply-To: <20260601-kvm-get_reg_list-v2-v5-1-415d08a2813b@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 5 Jun 2026 21:00:52 +0530
X-Gm-Features: AVVi8Cce39tEXaZNh-7VPeh51marCJL4-w1WK5dzfxiMGfPYAU1071UHao6Z9nE
Message-ID: <CAAhSdy0m+ZpxBznL-gx5ozpbyLzU7rO6zZnnB=5eZt=eLvV+sA@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] KVM: RISC-V: SBI FWFT: Mark vCPU CSRs dirty after
 setting feature value
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, greentime.hu@sifive.com, vincent.chen@sifive.com, 
	zong.li@sifive.com, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, inochiama@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_083105_510214_EF86229D 
X-CRM114-Status: GOOD (  13.00  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdW4gMSwgMjAyNiBhdCAzOjU24oCvUE0gWW9uZy1YdWFuIFdhbmcgPHlvbmd4dWFu
LndhbmdAc2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBNYXJrIHRoZSB2Q1BVIENTUnMgYXMgZGlydHkg
YWZ0ZXIgc3VjY2Vzc2Z1bGx5IHNldHRpbmcgYW4gRldGVCBmZWF0dXJlCj4gdmFsdWUuIEZXRlQg
ZmVhdHVyZXMgbWF5IG1vZGlmeSBDU1JzIChlLmcuLCBwb2ludGVyIG1hc2tpbmcgbW9kaWZpZXMK
PiBoZW52Y2ZnLlBNTSksIGFuZCBmYWlsaW5nIHRvIG1hcmsgdGhlbSBkaXJ0eSBjYW4gbGVhZCB0
byB0aGUgZ3Vlc3QKPiBvYnNlcnZpbmcgc3RhbGUgQ1NSIHN0YXRlIGFmdGVyIHZDUFUgc2NoZWR1
bGluZyBvciBtaWdyYXRpb24uCj4KPiBGaXhlczogMTMyM2E1Y2ZlNTJjICgiS1ZNOiByaXNjdjog
U2tpcCBDU1IgcmVzdG9yZSBpZiBWQ1BVIGlzIHJlbG9hZGVkIG9uIHRoZSBzYW1lIGNvcmUiKQo+
Cj4gU2lnbmVkLW9mZi1ieTogWW9uZy1YdWFuIFdhbmcgPHlvbmd4dWFuLndhbmdAc2lmaXZlLmNv
bT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4K
ClRoYW5rcywKQW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jIHwg
MSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3
ZnQuYwo+IGluZGV4IDJlYWIxNTMzOTY5NC4uNWU0YWFmYjBjYmYxIDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVf
c2JpX2Z3ZnQuYwo+IEBAIC01MjEsNiArNTIxLDcgQEAgc3RhdGljIGludCBrdm1fc2JpX2V4dF9m
d2Z0X3NldF9yZWcoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIHJlZ19udW0K
PiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICBjYXNlIDI6Cj4gICAgICAgICAgICAg
ICAgIHJldCA9IGNvbmYtPmZlYXR1cmUtPnNldCh2Y3B1LCBjb25mLCB0cnVlLCB2YWx1ZSk7Cj4g
KyAgICAgICAgICAgICAgIHZjcHUtPmFyY2guY3NyX2RpcnR5ID0gdHJ1ZTsKPiAgICAgICAgICAg
ICAgICAgYnJlYWs7Cj4gICAgICAgICBkZWZhdWx0Ogo+ICAgICAgICAgICAgICAgICByZXR1cm4g
LUVOT0VOVDsKPgo+IC0tCj4gMi40My43Cj4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2
bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
