Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56505F3D5E8
	for <kvm-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 08:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2qum6gD3HJ25YroaGSIYYeXi0mRCcH5+42BmObqyLuA=; b=Uv0tyLMaCPGkNQ
	0cwyyZm94iiqtdTlbk3iy5yulRh5Vw9mSRIaCMht2Y9f2ic6+EMgSdW3U51jlZMeIwrzpl3vrlGtv
	Do8hsRkbWDzfQTvJhqts4Zu4oI2fmx+i5ZfEtgumDsJa5I42jOOE5kemDEQDSfAhnknRveK3lGlQm
	9REeDMoyIIg9WDUsTahAKTkaIdcIVjir9oWBzeYcgHyjtPCGomlqCI7AP9FA9UOpjkYg1WVHPwEYw
	CnLt5VH4KxS7Waqe5nX7DYfA4UG5HMwF2Gaw1Rb9vz/q/EBMKaKLOOeQs7uhN7qi1sZexs63ppECk
	iquHI8S49BA8WiD9yZGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77xV-0000000Aqtm-0LJy;
	Mon, 30 Mar 2026 08:26:53 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77xT-0000000AqsZ-0ETV
	for kvm-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 08:26:52 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-67baf20e8c2so1769192eaf.3
        for <kvm-riscv@lists.infradead.org>; Mon, 30 Mar 2026 01:26:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774859210; cv=none;
        d=google.com; s=arc-20240605;
        b=gKhLs1/gcO3cu3Alcsyz/OiBe48bII5GaOfibVmRQxbF+cHUe9J4TZAQB/3bO8KSG+
         LlxRu5XtfQXE9D6AmYwADEeC+y/eZ7r24huOW0nj2SdTyKWfkGCkWNhf4ZxCJ6/0MFkQ
         hqSqZW+f6cUwb8LhiOIV0TA3tT2r5H7nxsCyZJQSE3kl8pUxP6t8HLxp56CRNNmgevrH
         e/mcwkgvE11a+dqT9G2+gVsykwTqQpMzMc8tI901Ar5m273gRC5l8Nslb+WHxkUuPiHo
         ZZDo28KOF8uYIy45qgH/F7Lq4NOH4qZ6gktRAdC3ztOehdXmXqxJzkZxTN1HG+JP6azL
         2UBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qm+c0B0VghS5x1igpBlA8KgdD3cjShXIS4o/gceuxM8=;
        fh=5yFDzCglPsfifI29q0AjrjYFefAp51CEBaTQLTxrFds=;
        b=HK82UOnvmbDhyqGQTjqwM86VNCAuQXKiJ0k+NNIaBxIjey02+r+zQsrhy9n1LMlaLS
         t6LInHTA0GHuVHFniwXtnt2kcQT9XpJFZamzVJ3kGzM/cGRMP5yZmttAfMuMok5hRl4z
         DRv5dBekZX0tUhzx6mgb4OHUiNlyRfM4c/RQ/+mkrcXauy9s2GoXwi0I+diZKekruAz1
         sHm0DNr6dNvTdrFbvPaXKOtyIyB5CDUZ/dmO0lG3r/755qCSmIJx49WWD7IlmPIBr8wC
         13qxFD+4EJoiZp2L7+1yGeah+Wih4DXNTAoSRnZb7D4JLSZ5tfg57tsYtd5wZEVrW76b
         7dXA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1774859210; x=1775464010; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qm+c0B0VghS5x1igpBlA8KgdD3cjShXIS4o/gceuxM8=;
        b=sjd68iKeCEIG2RwRMHtYv5fa0a0/Jy/PUhnDauiirURDm9ubrYqrWON7rAjA/G4Egb
         N4LRnBLq8gRkpYt1TN+9oJn1thUg75sLNwp9bsd7spbgprUTjj1M1QaXFeM/shMWzISZ
         n/DByDLwXL6S7PnMI3CCjBXB8BNSunixpfevCjNOxTz9OWpMUjhDO+htlKTsk2Xlzb0+
         CzcB6mVtfQkREsJ4ztN6z+IvAnkKLp5oIFyC9PdeVpt2KY3SnYppHK6UK0LaEags5vCm
         B5Lu94O9uelSVCtScuOlUBo87V/a8osZPSjJJ17gj+M1sc/MuFOFxAQKOdMKctDJ+Wj4
         AL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859210; x=1775464010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qm+c0B0VghS5x1igpBlA8KgdD3cjShXIS4o/gceuxM8=;
        b=i21nDO6jwFvAdUn5WoMp6DFUXz+BevPAzlnGnLg5PygZo54YAFz/zvwBbcnuMEEvTd
         dHuS9p+BmSNpmaVApaDJzlZHwhHLgiLizDMm9+F8fWdBODFBs3orydEl1auDvAeX5stQ
         64Rhhg2Ql2naMNqAieKjvfSLQrZDX+izVpWgrwyWVGMHr2GtSGPulWCf2P8KKd4pJTCt
         sm0KKlobMD5cn9epFMBQ5lwiXNT2vFYSfXKMJQOClZgA27altKPxFYJtQnIuOhxEQ4BP
         OJnW/XZK32f+Uyk5BZu5tqQk3xBCqKdbrfMTFS0S8/b3CVI7e0DpA+8baMtwdlnYvqGM
         6y7A==
X-Gm-Message-State: AOJu0YzhvjcP9so5whnMAUOIfCK8X3L7v2mcZQ0ijU5FO1mV6J6yW+Rz
	Q3EuHO/uebv2/kiJNb42WyTfhjDb6m2WiaxB5pu4R32dVy7ThHRpYlZ0vvdEkISy1W1YnFigyG3
	Hj2Knts45M4kpRGiCWYQMeDIagVBJnmNPltpmHIPffA==
X-Gm-Gg: ATEYQzx9pukbrmfeNNhHIVpnsx1+WhiYDezHa0Vi6E8B4R2aontkACZZlB29fLVUMTn
	3/mPJnYRG/jQoITxsguyoZbCNx3X1yA1bBq9+8ZHqoUczWNCrRyzv1hw1FviZXbyftqS+twLl3R
	noeda/vd6Tw45AZwpW+511HhYs1uOrQ6d10Avzv8XcrR+CxO3cM8/Uhe0/z6Xg468VpN1tSNwre
	JHH5dJ/ipfffBNg1SXeSrLm+ptVxJViRduOHK9UMMtkyo0ZpZuWd9kWT5BsUTjiigSqUq2udiY5
	2bJjt8KlZkYXb08qS93Fj+R3gNUvS+90+OOZtUANrAbfYgp3zHXcMxS3xVCXT8QuAv0/qpjrz0C
	n3s53kLwfhYINFWVaQYPNwla1hQ==
X-Received: by 2002:a05:6820:81c1:b0:67e:294b:726b with SMTP id
 006d021491bc7-67e294b7605mr3423411eaf.40.1774859210004; Mon, 30 Mar 2026
 01:26:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260318092956.708246-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260318092956.708246-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 30 Mar 2026 13:56:38 +0530
X-Gm-Features: AQROBzAttgYdkDk6vZa7Y9rWU3gasICclOjTZXUHJQOVCZXeCVLUqT-WwqE4H2U
Message-ID: <CAAhSdy01NHCwXRXMkpCrYSLpdApB5EC4kU9qig3q2KD1K34Atg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix double-free of sdata in kvm_pmu_clear_snapshot_area()
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Jiakai Xu <jiakaiPeanut@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_012651_105293_253A116E 
X-CRM114-Status: GOOD (  18.00  )
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

T24gV2VkLCBNYXIgMTgsIDIwMjYgYXQgMzowMOKAr1BNIEppYWthaSBYdSA8eHVqaWFrYWkyMDI1
QGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IEluIGt2bV9yaXNjdl92Y3B1X3BtdV9zbmFwc2hvdF9z
ZXRfc2htZW0oKSwgd2hlbiBrdm1fdmNwdV93cml0ZV9ndWVzdCgpCj4gZmFpbHMsIGt2cG11LT5z
ZGF0YSBpcyBmcmVlZCBidXQgbm90IHNldCB0byBOVUxMLiBUaGlzIGxlYXZlcyBhIGRhbmdsaW5n
Cj4gcG9pbnRlciB0aGF0IHdpbGwgYmUgZnJlZWQgYWdhaW4gd2hlbiBrdm1fcG11X2NsZWFyX3Nu
YXBzaG90X2FyZWEoKSBpcwo+IGNhbGxlZCBkdXJpbmcgdmNwdSB0ZWFyZG93biwgdHJpZ2dlcmlu
ZyBhIEtBU0FOIGRvdWJsZS1mcmVlIHJlcG9ydC4KPgo+IEZpcnN0IGZyZWUgb2NjdXJzIGluIGt2
bV9yaXNjdl92Y3B1X3BtdV9zbmFwc2hvdF9zZXRfc2htZW0oKToKPiAga3ZtX3Jpc2N2X3ZjcHVf
cG11X3NuYXBzaG90X3NldF9zaG1lbSBhcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jOjQ0Mwo+ICBr
dm1fc2JpX2V4dF9wbXVfaGFuZGxlciBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9wbXUuYzo3NAo+
ICBrdm1fcmlzY3ZfdmNwdV9zYmlfZWNhbGwgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYzo2MDgK
PiAga3ZtX3Jpc2N2X3ZjcHVfZXhpdCBhcmNoL3Jpc2N2L2t2bS92Y3B1X2V4aXQuYzoyNDAKPiAg
a3ZtX2FyY2hfdmNwdV9pb2N0bF9ydW4gYXJjaC9yaXNjdi9rdm0vdmNwdS5jOjEwMDgKPiAga3Zt
X3ZjcHVfaW9jdGwgdmlydC9rdm0va3ZtX21haW4uYzo0NDc2Cj4KPiBTZWNvbmQgZnJlZSAoZG91
YmxlLWZyZWUpIG9jY3VycyBpbiBrdm1fcG11X2NsZWFyX3NuYXBzaG90X2FyZWEoKToKPiAga3Zt
X3BtdV9jbGVhcl9zbmFwc2hvdF9hcmVhIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmM6NDAzIFtp
bmxpbmVdCj4gIGt2bV9yaXNjdl92Y3B1X3BtdV9kZWluaXQucGFydCBhcmNoL3Jpc2N2L2t2bS92
Y3B1X3BtdS5jOjkwNQo+ICBrdm1fcmlzY3ZfdmNwdV9wbXVfZGVpbml0IGFyY2gvcmlzY3Yva3Zt
L3ZjcHVfcG11LmM6ODkzCj4gIGt2bV9hcmNoX3ZjcHVfZGVzdHJveSBhcmNoL3Jpc2N2L2t2bS92
Y3B1LmM6MTk5Cj4gIGt2bV92Y3B1X2Rlc3Ryb3kgdmlydC9rdm0va3ZtX21haW4uYzo0NjkgW2lu
bGluZV0KPiAga3ZtX2Rlc3Ryb3lfdmNwdXMgdmlydC9rdm0va3ZtX21haW4uYzo0ODkKPiAga3Zt
X2FyY2hfZGVzdHJveV92bSBhcmNoL3Jpc2N2L2t2bS92bS5jOjU0Cj4gIGt2bV9kZXN0cm95X3Zt
IHZpcnQva3ZtL2t2bV9tYWluLmM6MTMwMSBbaW5saW5lXQo+ICBrdm1fcHV0X2t2bSB2aXJ0L2t2
bS9rdm1fbWFpbi5jOjEzMzgKPiAga3ZtX3ZtX3JlbGVhc2UgdmlydC9rdm0va3ZtX21haW4uYzox
MzYxCj4KPiBGaXggaXQgYnkgc2V0dGluZyBrdnBtdS0+c2RhdGEgdG8gTlVMTCBhZnRlciBrZnJl
ZSgpIGluCj4ga3ZtX3Jpc2N2X3ZjcHVfcG11X3NuYXBzaG90X3NldF9zaG1lbSgpLCBzbyB0aGF0
IHRoZSBzdWJzZXF1ZW50Cj4ga2ZyZWUoTlVMTCkgaW4ga3ZtX3BtdV9jbGVhcl9zbmFwc2hvdF9h
cmVhKCkgYmVjb21lcyBhIHNhZmUgbm8tb3AuCj4KPiBUaGlzIGJ1ZyB3YXMgZm91bmQgYnkgZnV6
emluZyB0aGUgS1ZNIFJJU0MtViBQTVUgaW50ZXJmYWNlLgo+Cj4gRml4ZXM6IGMyZjQxZGRiY2Rk
NzU2ICgiUklTQy1WOiBLVk06IEltcGxlbWVudCBTQkkgUE1VIFNuYXBzaG90IGZlYXR1cmUiKQo+
IFNpZ25lZC1vZmYtYnk6IEppYWthaSBYdSA8amlha2FpUGVhbnV0QGdtYWlsLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBKaWFrYWkgWHUgPHh1amlha2FpMjAyNUBpc2Nhcy5hYy5jbj4KClF1ZXVlZCB0
aGlzIHBhdGNoIGZvciBMaW51eC03LjEKClRoYW5rcywKQW51cAoKCj4gLS0tCj4gIGFyY2gvcmlz
Y3Yva3ZtL3ZjcHVfcG11LmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYyBiL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHVfcG11LmMKPiBpbmRleCBlODczNDMwZTU5NmIyLi5hYzFiOWE5MWExOWRiIDEwMDY0
NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2
bS92Y3B1X3BtdS5jCj4gQEAgLTQ0MSw2ICs0NDEsNyBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfcG11
X3NuYXBzaG90X3NldF9zaG1lbShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGxvbmcg
cwo+ICAgICAgICAgLyogTm8gbmVlZCB0byBjaGVjayB3cml0YWJsZSBzbG90IGV4cGxpY2l0bHkg
YXMga3ZtX3ZjcHVfd3JpdGVfZ3Vlc3QgZG9lcyBpdCBpbnRlcm5hbGx5ICovCj4gICAgICAgICBp
ZiAoa3ZtX3ZjcHVfd3JpdGVfZ3Vlc3QodmNwdSwgc2FkZHIsIGt2cG11LT5zZGF0YSwgc25hcHNo
b3RfYXJlYV9zaXplKSkgewo+ICAgICAgICAgICAgICAgICBrZnJlZShrdnBtdS0+c2RhdGEpOwo+
ICsgICAgICAgICAgICAgICBrdnBtdS0+c2RhdGEgPSBOVUxMOwo+ICAgICAgICAgICAgICAgICBz
YmlyZXQgPSBTQklfRVJSX0lOVkFMSURfQUREUkVTUzsKPiAgICAgICAgICAgICAgICAgZ290byBv
dXQ7Cj4gICAgICAgICB9Cj4gLS0KPiAyLjM0LjEKPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxp
c3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
