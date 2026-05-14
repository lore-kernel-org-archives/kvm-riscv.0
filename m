Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79713CD4851
	for <kvm-riscv@archiver.kernel.org>; Thu, 14 May 2026 13:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JJT8teEssXoPhtRx7Yt5J3XQq46HvfcGnQakn0C2rFY=; b=glraEpSOTWk0pw
	2FwwYL2FEM+pklxu4vzoUla8+FSKCsHVYRA2BtfraAzj2tQihlyixtq+nAmi395B6ipYFMZMqGBZ2
	B1T0G8kkPIMTY54SqyOTS5YomjnqoN61Ewfd9lBIJsx39PYhcHwlYGw05PIu36oZA0gZSepMLpLLA
	b73mnENBqjEvN3zcMHyT7ul8GN1LYze0qGc1P4EtnsoeQX/rv77+sIQELYLMC21WW6bv8hBkQABgC
	2hMJyAWVBM+rL0yZOL5zutDeacyvW9ZgGo7kWeuKPAu751j8LSEdt9oBndFKeC8PKst1cb0YLICsi
	i9PoU4+7sU85E1NR7hJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNWLU-00000005cjG-0CkW;
	Thu, 14 May 2026 13:43:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNWLR-00000005ciA-44bZ
	for kvm-riscv@bombadil.infradead.org;
	Thu, 14 May 2026 13:43:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=h6d8VthjlyqVFZ52dWXLfCKwuTt5I0MIUqg/9Vw2be8=; b=ofXKUF4U5/MjGp9PeifCxuPP4O
	7YzcEUfI6VmaXdIiLt2eGJcEZFP20zdlrVMtTgD9VOHGfPqvYxSw5t/8eAl23dq4dCp492t5FRiNW
	JoN4TXxh3CEPZbFxWABMImnbv/FGmMqsynRsCWG4Qyd5tviYykCWY8Q6XQnhYCRkjLp/CyBCP3ACl
	s3SBqUDJi0oI+qb5rQK06wzCyFPLHFaocyxrLCR9kPuMvUyG6gKBijV2h7YUOk0/12kgPAIpYrSLd
	YMxDglvA0mMRbf9HNuPih75HW1XLA7AiumCytphkCaEWVyndZEjosPJEX8E83zCnBu2DQUR7yzg30
	XoUvxOhA==;
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNWLO-000000030cW-2jHc
	for kvm-riscv@lists.infradead.org;
	Thu, 14 May 2026 13:43:20 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-67c250805ccso3000457eaf.1
        for <kvm-riscv@lists.infradead.org>; Thu, 14 May 2026 06:43:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778766196; cv=none;
        d=google.com; s=arc-20240605;
        b=EK/oZBdQyOL5eOFAKKNojd1iz4em6gmQBFsWaiUJ02YMquwktkcUE1JTKsn1+1sJp+
         HlXiR8Q0lxzKv2QDo/16LpZZhoBn9LKpVpdYrWUJo8sNG2suH2TYMFpXUOjXe1n92Sif
         8l68SfcKW13lfwrAIzisQYPEtJfiSrjcByl76x+a2G2TzdUP4aV0jNfEeffAFZIzsVOe
         QbZba/9iAkey/RjOERN8TZsNIf+CR5T+Al4/oeZyEFSZO8BoFynxYKMLGzAUvASVAMYs
         MWIyL7aC7jc8lDVNGbELKq8KWlOaA+EV5+hRZiB+HK6sJN2GTMuf45tqOBsXSjj7ZoF/
         EeVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h6d8VthjlyqVFZ52dWXLfCKwuTt5I0MIUqg/9Vw2be8=;
        fh=AXO6awT89Hle80BOBGt8mIOSi66qxEBir9T+7yewqlU=;
        b=amX4E1nNRxgH7R9hHXI6IeVIbYUmCG+Gmtc9Fn58bDb40idKcaGpxzB+7Lv7qVOxZw
         Yvctx0/Xwdw/dyIjjO7R/Xy+a4hFa1hC5t7J5JUijoQojkMMPbPKYRLRTl7uLbS3rJEi
         uD+7xYEyPPnY61+yykyqGPO5uQUkFH4SxGQUDkfxZbv5XJFjIzgHgFEN0zcAnPbisMRl
         UApPlvoFN7Pbj6otCNPO3ruINH9Kzt2V6l+w0g/Q0jYDV8uBlYjaM9ePmSM9YSYNIv4g
         7S4N82mDYlJLTDJA6vrFe0K0+m5Ju5al6u31BXpVSCufMl65eQQ+loIalbwS3UO8OPME
         33uQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778766196; x=1779370996; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6d8VthjlyqVFZ52dWXLfCKwuTt5I0MIUqg/9Vw2be8=;
        b=QFpj0UJR8xnehFEmeKuaBKKkcSofpdekgl/BVOkEYsT2kuxHl/pu0Gl1drC34CbhSI
         mhSayLQ/O8IaPfgMe/7ZXNRh9JRRlDZIYG1mieAWy7MFjkAlItvjrbpH/iJjUB8cR+mF
         muEjGc9yjYhVQSJjFfZ+rumFrzJ+K0PHf3UET0NUWSL2/3pAhpBi6CXPsB3yE95w0uSM
         ZeiGTAtofYrQOz6aAXCAbWPEdmMOX4rpESCgqUzeSqQiKW6DAIAHbKksTTOvocbl7z8e
         sdSi/OVsWFwlw0IqzhYmUf/hPucRosnFQD/W9UaZ8l5j7i9aJwsQlh2aB6pMMmFaSn2Q
         ozLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778766196; x=1779370996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h6d8VthjlyqVFZ52dWXLfCKwuTt5I0MIUqg/9Vw2be8=;
        b=AcQ8eY2R5Ho2PzYNRwiiZemf7nnBbyrIXZ0Q4A29/LvMnk1V1vZo+RM0cpTW1HWMBl
         P2143Fx22RaV0y4eDsp5alwy0NtLyzeQN1Lym2vvNSltxAbgXWxJDqctSxYMq7ww6P+X
         fq3gKU5eFlWMM/GEyAxBDQC0o8OFQhMySc+pyVBB4S7Dxw4uN7LLBomoWRvUdggv1Eaj
         m1AmUuVLIl4Bd147sCpixYlKIHsGaB21Lo0gRk6vmuum5c8xUAwgyDHYsqeax5AnrHtD
         x1DObpvIMV2C0lvoyMNfGOc+eE1s2PPceYTDARiRKZfzPr4lBD2sex1JpPHVqopMKed8
         Ikog==
X-Forwarded-Encrypted: i=1; AFNElJ+F+JIQxRYMTjYi2n6UdGXdqyYmA21fpMxvC1YnSnrnqSTiGMkTtyxbyuleLR5a8RT5hdmQu0Cv+xE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2zf30aWO/0aOzDwHRX1q5O3pqZgKS06wSTsmYy4z/ozEWw1yj
	PuMN10KRZLfW9K5V+f3/rxIBJKsBgqPm4QGuYZ6sqTmKt8VmqoSpraM3oWMDxp0u+7zTjTF3Rwq
	m1QjjYiAXoseSWTdZkkyKk/Igr04M3LisXs2y2Ig1TQ==
X-Gm-Gg: Acq92OE1DuapapAXuFIv8S/Z5zXRhFq0jsm5v+3n5g5hPlQVvcF6tDzPGVTGBmKj4M4
	KqLGDTN78LqwZH1ROpb3pUtGW4QvCqU/9lbP6WxqQVdHrnjuFMvadQVTdoH6aKnK2BQNDksBq4g
	67rsCU2gCjK3jwsx1iowkoxQWfQznf1QIeWWLhEl1UFF/Wm+k1ybZ2fQS+e6SST0mV9MPSX+fQo
	WHwx9VpgnXWLg6LqstYijYvXvHeJU46CIyX9kWM4CknfXYNutQJnFYO3JuNbyaAJEwrlHYSxdSb
	JaqtZHJYpC7uqgpQNCcrxXs6cL2ECHi6nJKS2denJLf2EIMWMewKDkP0uanR/n+RRD1xuB6imgm
	3thwFBRRFH5VznJnRsHOWT+Mr84k=
X-Received: by 2002:a05:6820:1525:b0:696:17a7:498c with SMTP id
 006d021491bc7-69b78dd26b8mr4064734eaf.30.1778766196074; Thu, 14 May 2026
 06:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260415220930.287592-1-osama.abdelkader@gmail.com>
In-Reply-To: <20260415220930.287592-1-osama.abdelkader@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 14 May 2026 19:13:04 +0530
X-Gm-Features: AVHnY4IYOTnFk_hk2daMk_NQTXJRetF68AXlyGAJYT-GkJrVasSFzbM3upXos9s
Message-ID: <CAAhSdy3LpnWtc9iTnND2ez4WK8WJUF_edYaDfD9Nd8_F3dPJFg@mail.gmail.com>
Subject: Re: [RFC PATCH] riscv: kvm: return SBI_ERR_FAILURE for PMU shmem OOM
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_144319_053270_0A011C32 
X-CRM114-Status: GOOD (  16.17  )
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

T24gVGh1LCBBcHIgMTYsIDIwMjYgYXQgMzo0MOKAr0FNIE9zYW1hIEFiZGVsa2FkZXIKPG9zYW1h
LmFiZGVsa2FkZXJAZ21haWwuY29tPiB3cm90ZToKPgo+IGt2bV9yaXNjdl92Y3B1X3BtdV9zbmFw
c2hvdF9zZXRfc2htZW0oKSBhbmQga3ZtX3Jpc2N2X3ZjcHVfcG11X2V2ZW50X2luZm8oKQo+IHJl
dHVybmVkIC1FTk9NRU0gZnJvbSB0aGUgU0JJIGV4dGVuc2lvbiBoYW5kbGVyLCB3aGljaCBjYXVz
ZWQKPiBrdm1fcmlzY3ZfdmNwdV9zYmlfZWNhbGwoKSB0byBhYm9ydCBLVk1fUlVOIGFuZCBzdXJm
YWNlIHRoZSBlcnJvciB0bwo+IHVzZXJzcGFjZSBpbnN0ZWFkIG9mIGNvbXBsZXRpbmcgdGhlIEVD
QUxMIHdpdGggYSBuZWdhdGl2ZSBTQkkgZXJyb3IgaW4gYTAuCj4gVXNlIFNCSV9FUlJfRkFJTFVS
RSBhbmQgdGhlIG5vcm1hbCByZXRkYXRhIHBhdGgsIG1hdGNoaW5nIG90aGVyIFBNVQo+IGhhbmRs
ZXJzIGFuZCBrdm1fc2JpX2V4dF9wbXVfaGFuZGxlciBjb21tZW50Lgo+Cj4gU2lnbmVkLW9mZi1i
eTogT3NhbWEgQWJkZWxrYWRlciA8b3NhbWEuYWJkZWxrYWRlckBnbWFpbC5jb20+CgpTcGxpdCB0
aGlzIGludG8gdHdvIHBhdGNoZXMgd2hlcmU6CgoxKSBPbmUgcGF0Y2ggZml4aW5nIGt2bV9yaXNj
dl92Y3B1X3BtdV9zbmFwc2hvdF9zZXRfc2htZW0oKQoyKSBTZWNvbmQgcGF0Y2ggZml4aW5nIGt2
bV9yaXNjdl92Y3B1X3BtdV9ldmVudF9pbmZvKCkKCk1ha2Ugc3VyZSB0byBhZGQgRml4ZXMgdGFn
IGluIGJvdGggcGF0Y2hlcy4KClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3Zt
L3ZjcHVfcG11LmMgfCAxMiArKysrKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92
Y3B1X3BtdS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYwo+IGluZGV4IGU4NzM0MzBlNTk2
Yi4uZjM2YjA5OWY0NDdjIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMK
PiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jCj4gQEAgLTQzNSw4ICs0MzUsMTAgQEAg
aW50IGt2bV9yaXNjdl92Y3B1X3BtdV9zbmFwc2hvdF9zZXRfc2htZW0oc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LCB1bnNpZ25lZCBsb25nIHMKPiAgICAgICAgIH0KPgo+ICAgICAgICAga3ZwbXUtPnNk
YXRhID0ga3phbGxvYyhzbmFwc2hvdF9hcmVhX3NpemUsIEdGUF9BVE9NSUMpOwo+IC0gICAgICAg
aWYgKCFrdnBtdS0+c2RhdGEpCj4gLSAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ICsg
ICAgICAgaWYgKCFrdnBtdS0+c2RhdGEpIHsKPiArICAgICAgICAgICAgICAgc2JpcmV0ID0gU0JJ
X0VSUl9GQUlMVVJFOwo+ICsgICAgICAgICAgICAgICBnb3RvIG91dDsKPiArICAgICAgIH0KPgo+
ICAgICAgICAgLyogTm8gbmVlZCB0byBjaGVjayB3cml0YWJsZSBzbG90IGV4cGxpY2l0bHkgYXMg
a3ZtX3ZjcHVfd3JpdGVfZ3Vlc3QgZG9lcyBpdCBpbnRlcm5hbGx5ICovCj4gICAgICAgICBpZiAo
a3ZtX3ZjcHVfd3JpdGVfZ3Vlc3QodmNwdSwgc2FkZHIsIGt2cG11LT5zZGF0YSwgc25hcHNob3Rf
YXJlYV9zaXplKSkgewo+IEBAIC00ODAsOCArNDgyLDEwIEBAIGludCBrdm1fcmlzY3ZfdmNwdV9w
bXVfZXZlbnRfaW5mbyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGxvbmcgc2FkZHJf
bG93Cj4gICAgICAgICB9Cj4KPiAgICAgICAgIGVpbmZvID0ga3phbGxvYyhzaG1lbV9zaXplLCBH
RlBfS0VSTkVMKTsKPiAtICAgICAgIGlmICghZWluZm8pCj4gLSAgICAgICAgICAgICAgIHJldHVy
biAtRU5PTUVNOwo+ICsgICAgICAgaWYgKCFlaW5mbykgewo+ICsgICAgICAgICAgICAgICByZXQg
PSBTQklfRVJSX0ZBSUxVUkU7Cj4gKyAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ICsgICAgICAg
fQo+Cj4gICAgICAgICByZXQgPSBrdm1fdmNwdV9yZWFkX2d1ZXN0KHZjcHUsIHNobWVtLCBlaW5m
bywgc2htZW1fc2l6ZSk7Cj4gICAgICAgICBpZiAocmV0KSB7Cj4gLS0KPiAyLjQzLjAKPgoKLS0g
Cmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
