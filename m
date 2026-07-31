Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760AFC55167
	for <kvm-riscv@archiver.kernel.org>; Fri, 31 Jul 2026 05:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bNuyaPTgnBHjmBoS7TmTO1D6HglqpNok50UzAHcVg3k=; b=gZdEYGbH8GkrSV
	dbxobvXdpF826c1AIqqYZEs+60oWeihay0JkTiQMnkmPtppwlSOFTP4yWz6sacsaND8jpUE4B9GNp
	PGImz2FNyDpVcXnO4fteSbJta8HEzMa6Tc1mpQ9EhKlkQFAESNforyBKUUGe5vWET9gNVjlNHjJPK
	5uCxIrOjgUQ+MExXEt6KQaKCXvnOlyk5PEZEk1tnl0vc8P8YMqPTx0wSty0l6i3aKseENKhOXNJsV
	fb1re9uTYaNv1YaTZWjcvTUrezlcH9r0q4f+1WScG0K7MBnVTLlnhg7yT1KlKfR9ZhDtTMS89WpBU
	lGHWXVMCro+O0IfNl+OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpftd-0000000Bo0v-2uVm;
	Fri, 31 Jul 2026 05:35:01 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpfta-0000000Bnyw-0L9z
	for kvm-riscv@lists.infradead.org;
	Fri, 31 Jul 2026 05:35:00 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so521021f8f.2
        for <kvm-riscv@lists.infradead.org>; Thu, 30 Jul 2026 22:34:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785476095; cv=none;
        d=google.com; s=arc-20260327;
        b=N0Q59y6/EJYiJV33CFP414NDGNt+J6WRB7juSLfQjDXwk0BOVUFJDRp0O7nveVnYnW
         XarmglhWYoXKqWVHJ8MDVw7wn/Ru4Dn04PH8lLOpM01i1J5aLi7fNk7rBd4BFmmnBuoA
         vSQSVh5Ln6KH45xTfijvxxxokUW7f8nPZSw6SIs6bWJFS5hG3OZcPFuxWIEl6Lt9wbml
         BuGiteBne4utytr9yrMX11tmWBSkBNGf6aR4kwwHeSQnhxTNqLYj6L+SsPQxGcJbmYE5
         vQlUCUaSN7phYMGbreG95QeZng5AynWAM0nDNi/T6N8tKwN7RcPalMQvC/Q0NRpAAGUv
         rbdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NpDPKiNmGUabqt3eiQx1uoLP1i93SqQSGHcFDJqZaIs=;
        fh=yGFjK0nCRGtrCzE5nMNrVcqxtJMHWs9xVrOduedUlaE=;
        b=eYyC1/SyMQ/W728OxgN1Yh39Y2WdlTGAd2vfLy80Goqz++5iA3Q/BcsJDn4UVAvCR5
         G5nlIwSOLRLCFWrEo3FX60BEFxysdAQ8cHEUJB5PcSTm5GKZCUy15A24YWxBnkHvx/60
         hLJAjjtiBEcCKHxhU30yt2HvWjjtocwR8zQz8Oo8NK60/uKtAXmW9FkPniMK+3p3rwny
         HeynsbD6oZuSkI5vdv6d/vG4dv3HEkjDdjX5pLfkCvSJrjLD4NpgHi/jg8zrxTjPJhBx
         adQKTpKuj2s1oLnh/IEELc30RM5AuBiZgGKSDaT5UHPi23wZ5bLT5xHEZFsm+0s87RWm
         Cw+Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785476095; x=1786080895; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NpDPKiNmGUabqt3eiQx1uoLP1i93SqQSGHcFDJqZaIs=;
        b=Qa3S3yZTHLngEwUSJjLdLWK5fNHAWd2DzYeccJKQmVRUw1IzzxNM3a1lik5KlXcaFV
         PBuCxRyaQL0wbuZga6kqBpCl0ZKSIoeLYm0ka+PgqaBOARBc63lhhKHcqgDeiOQonywK
         ESrceQNTJIWhPrSW9vURtC+Z0UUitf3Z6ZVhpmvax1s2lVi7TP1FT7IE8523HolG67ou
         3hgoLJ6vvD5YIy6y6vKtdTv42WPVs6bQye+30qq74TRv/N9TgHa62H+DTfAnbult8AiK
         dQfnglfzdFioV188EX1Vx7n6oYzRf+P8oqnI66dsT9L5UiQCLC7VE7Bo6A2tIQEmF29L
         1l5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785476095; x=1786080895;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NpDPKiNmGUabqt3eiQx1uoLP1i93SqQSGHcFDJqZaIs=;
        b=CrwmlcSBi4IlD3XXose4cTGnL/m54w7mdIxyqXMzG7gUYIO4cCXqF0AxzlQKxistSA
         GokX4HZhCSoPraOIZYO1h15V3u+PW1PZpy+x4wa67mzbhJs7a1fl9mx7ed0PIb735Mqp
         CuatCirYMuWzGUBgwGfyWrMVx7i2xDAWc+j/Ou3dH0fw3W14Szy9QPfkcyI4k4ZPziw1
         6Qw3TNWhRwN1lqa8jk/sOMU87Hh/85Ef1cpViAhaABbml9f85cTbWaQKnaozOz6u3CDn
         xo8iwcwPIM9jK/aGKC9V9mO6EM3aAClaSPFfCk9LZoyLm5OsIhwIQHbfAmYMxMIwG8so
         IqYw==
X-Forwarded-Encrypted: i=1; AHgh+RrmYeWdnsaU4KkYor5k34PH6aFuyQG8W1yNprZeDqG554lVrXpotCId1q67ZVHS95XOd/X1BcHbFvI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0t7nGXPcGaHNW8xrA3Nj+4J36tVdz58UlxxRC/sE2OaUxWQKi
	LhoeHKDpcMbp44NBrL4UpxQpM34rCtlrUgBF9qtG47QejZIGxmBXzfNjM1n2vd+0CpVQA5SwbcC
	8IWkXDb+kZ9pn1e0SsDtyz4eiSAIxcKf3SIaBTrjB7w==
X-Gm-Gg: AR+sD12C+30zN1RExYW9qFzW0eQ3wOlThXtr4pmWhJGwUEjlxFpleW+fmul/vbvzMTi
	MNt7DieFoWCl5+oCPvWj6+x1DidiiQ4KAj2dAHGluxB5OiIlTqsk7xCss0dNU1Z3liPS3hALyZf
	DGtIlmQIy++BtrO6IgboIQZOP5I3o5u3TXVZqvMMY3Sd/r7S5h5Fxe2Mk0jsA5T0Jji0rWnRgFZ
	AXcAbATd5oRa5NuvzBucJMRxV8Aqd94bwYX3FrykOTSoY2xmT7I0jrj05oknTwbmn25wzrTD+gq
	aCnrEpB8OyNZpxezDjQYhP8B9a9fzUVxTZVZQFqCfCGIHa2nFKTBRgI+wHpK/dXDrWMak07kYAS
	mcpet38fysvJmk012XTkItR4+Cx9/SnWtzpFecRDMu8vltwIR+yj4eCFkF6D/EWA=
X-Received: by 2002:a05:6000:2311:b0:47f:cbbd:30ea with SMTP id
 ffacd0b85a97d-47fd2adbd1bmr1653851f8f.14.1785476094426; Thu, 30 Jul 2026
 22:34:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260701120954.129873-1-wang.yechao255@zte.com.cn> <20260701120954.129873-2-wang.yechao255@zte.com.cn>
In-Reply-To: <20260701120954.129873-2-wang.yechao255@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 31 Jul 2026 11:04:42 +0530
X-Gm-Features: AUfX_mz-aI72aPwGaPZcnLKH5SWuqKULd4t8IFNAhAJTGqns5eM5RX6MLLFbxew
Message-ID: <CAAhSdy0_dCHC+ZVG7HZdtUxZWWX_KG3YfN=ngVdpy-7_pquUFA@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] RISC-V: KVM: Add the split page cache for ioctl context
To: Wang Yechao <wang.yechao255@zte.com.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_223458_376826_E49C30BD 
X-CRM114-Status: GOOD (  17.00  )
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

T24gV2VkLCBKdWwgMSwgMjAyNiBhdCA1OjQx4oCvUE0gV2FuZyBZZWNoYW8gPHdhbmcueWVjaGFv
MjU1QHp0ZS5jb20uY24+IHdyb3RlOgo+Cj4gQWRkIHRoZSBzcGxpdCBwYWdlIGNhY2hlIGZvciBk
aXJ0eSBsb2dnaW5nIGVuYWJsZW1lbnQgYW5kIHRoZQo+IEtWTV9DTEVBUl9ESVJUWV9MT0cgaW9j
dGwuCj4KPiBTaWduZWQtb2ZmLWJ5OiBXYW5nIFllY2hhbyA8d2FuZy55ZWNoYW8yNTVAenRlLmNv
bS5jbj4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIHwgMSArCj4g
IGFyY2gvcmlzY3Yva3ZtL21tdS5jICAgICAgICAgICAgICB8IDEgKwo+ICBhcmNoL3Jpc2N2L2t2
bS92bS5jICAgICAgICAgICAgICAgfCA2ICsrKysrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDggaW5z
ZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hv
c3QuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAo+IGluZGV4IDYwMDE3Y2Vl
YzlkMmEuLjY5ZjczZmQxMDZhOTQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9rdm1faG9zdC5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4g
QEAgLTg2LDYgKzg2LDcgQEAgc3RydWN0IGt2bV9hcmNoIHsKPiAgICAgICAgIHBnZF90ICpwZ2Q7
Cj4gICAgICAgICBwaHlzX2FkZHJfdCBwZ2RfcGh5czsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcg
cGdkX2xldmVsczsKPiArICAgICAgIHN0cnVjdCBrdm1fbW11X21lbW9yeV9jYWNoZSBwZ2Rfc3Bs
aXRfcGFnZV9jYWNoZTsKPgo+ICAgICAgICAgLyogR3Vlc3QgVGltZXIgKi8KPiAgICAgICAgIHN0
cnVjdCBrdm1fZ3Vlc3RfdGltZXIgdGltZXI7Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3Zt
L21tdS5jIGIvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiBpbmRleCAwODJmOWIyNjE3MzM4Li45Y2Y2
OWJjMjhiOWM1IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gKysrIGIvYXJj
aC9yaXNjdi9rdm0vbW11LmMKPiBAQCAtNjc2LDYgKzY3Niw3IEBAIGludCBrdm1fcmlzY3ZfbW11
X2FsbG9jX3BnZChzdHJ1Y3Qga3ZtICprdm0pCj4gICAgICAgICBrdm0tPmFyY2gucGdkID0gcGFn
ZV90b192aXJ0KHBnZF9wYWdlKTsKPiAgICAgICAgIGt2bS0+YXJjaC5wZ2RfcGh5cyA9IHBhZ2Vf
dG9fcGh5cyhwZ2RfcGFnZSk7Cj4gICAgICAgICBrdm0tPmFyY2gucGdkX2xldmVscyA9IGt2bV9y
aXNjdl9nc3RhZ2VfbWF4X3BnZF9sZXZlbHM7Cj4gKyAgICAgICBrdm0tPmFyY2gucGdkX3NwbGl0
X3BhZ2VfY2FjaGUuZ2ZwX3plcm8gPSBfX0dGUF9aRVJPOwo+Cj4gICAgICAgICByZXR1cm4gMDsK
PiAgfQo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92bS5jIGIvYXJjaC9yaXNjdi9rdm0v
dm0uYwo+IGluZGV4IGE5ZjA4M2ZlZWI3NjcuLmJlMzhmMjRhMjk3ZDYgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9yaXNjdi9rdm0vdm0uYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZtLmMKPiBAQCAtNTQs
NiArNTQsMTIgQEAgdm9pZCBrdm1fYXJjaF9kZXN0cm95X3ZtKHN0cnVjdCBrdm0gKmt2bSkKPiAg
ICAgICAgIGt2bV9kZXN0cm95X3ZjcHVzKGt2bSk7Cj4KPiAgICAgICAgIGt2bV9yaXNjdl9haWFf
ZGVzdHJveV92bShrdm0pOwo+ICsKPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBGcmVlIHRoZSBz
cGxpdCBwYWdlIGNhY2hlIGFmdGVyIGFsbCB2Q1BVcyBhbmQgZGV2aWNlcyBhcmUgZGVzdHJveWVk
Lgo+ICsgICAgICAgICogQXQgdGhpcyBwb2ludCwgdGhlcmUgYXJlIG5vIGNvbmN1cnJlbnQgYWNj
ZXNzZXMgdG8gdGhlIGNhY2hlLgo+ICsgICAgICAgICovCj4gKyAgICAgICBrdm1fbW11X2ZyZWVf
bWVtb3J5X2NhY2hlKCZrdm0tPmFyY2gucGdkX3NwbGl0X3BhZ2VfY2FjaGUpOwoKQmV0dGVyIHRv
IGRvIHRoaXMgaW4ga3ZtX3Jpc2N2X21tdV9mcmVlX3BnZCgpCgpSZWdhcmRzLApBbnVwCgotLSAK
a3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
