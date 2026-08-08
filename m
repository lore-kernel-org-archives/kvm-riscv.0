Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191E8C55174
	for <kvm-riscv@archiver.kernel.org>; Sat,  8 Aug 2026 08:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iMTTTvSKmxgOafiR8EABBGnnAIxqG4H80NhSnqdUmis=; b=MftSNNZdniVzVS
	3veX9+9+9j5XqwBV/WZOluGrHvxUigwlsXH30oJWIT2mTprQPnv/2ZrlSENBzEFeaOF+PUJesJdCV
	oPWNJGf6uCxE1o3IOI8101aMQCoaT8JOfc6VzC13Wmj9DzoLxB9HZ15JouFo+KHu3KN2clOUrI0Jp
	k0IGEBrFuGW5WcT4E+REQ4RpXzAxYiR06qG9Ym+IWHej7UQu/3cGe3S+KeVEI2qUCvfEJ3Jz9bYWz
	kUh4uAItI1DoN0Ap/GocKMDvXAO4tfJeZjtcdKHQRQVberK3ordYkIna5Mjyytovn9kEr0ky9dGG1
	Pjw0dDmmm4/iHbCjrnoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wscKK-00000009A4r-3MFD;
	Sat, 08 Aug 2026 08:22:44 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wscKJ-00000009A3p-0S9S
	for kvm-riscv@lists.infradead.org;
	Sat, 08 Aug 2026 08:22:44 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so3278575e9.2
        for <kvm-riscv@lists.infradead.org>; Sat, 08 Aug 2026 01:22:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786177361; cv=none;
        d=google.com; s=arc-20260327;
        b=ctLSJ8vyfKIftoNwUbdNblm+RpoFaufCUsH/Gyb8GswbEqPWHvKxJ5k+55gbpgeiaa
         gCoYRmawnRb0t2L5RBWpTDufFunYd+QPVsnddhNOhSBrNW2IzAR6CH8IhvrJZoOL4WO+
         t5oDaXOY3t3sTBNm/5lplyIwsO0ChJSHMoRUti+9rDfzo04Gkwlrqjiq9qFJUfrvLnW3
         nFiEIMSvTGZBRMyDrw1c1oiSqQkYMwWYmTdRDAUygnidhKXqW6qJ7eFl4FhegNpF27fp
         coJe1BUunmyHw75sj6+2D3Oibnt4AdVrXYhZ/Mq0aHZw0evjLWbGylLdEYteYpMl4Q4b
         W4PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aRXS8tM+rb30ygIbdTjOMxib33mj9VgRC9Oyc94RXsk=;
        fh=KaFPourcEu+e4RdPVE/mPWZpIT2d0FYIP2PakG/EVIs=;
        b=iYbZOdA7tidL4wDMLU8Zl7v7E2VVliQR1xXRvAkG5nmXJR9kMNsmqMM3USTJinwiwN
         sHWXHZyCeRJ8TW++Or5fSxFi1Z51NF1Z0/jO+KQZHzU0kCnxaswPeLZMtt9T0JPi78Yn
         5LBuB0eLXV94q5JUj+zzLFLY21aCezcUCr2FfPxCxLUNE57y+xL9jT+PW6yWFQCZ5oSN
         Rn4dOqGznzO7qcoLyGzIRKd2rRAlNUsEgvqBi1iwl+OR0aNG7EHuiAee2Nzoa39OP77d
         ue+Z9PZvsKOcibvhbEDWOzZfcwCdXnFqIC6AAB//wDR438fnPrK5lrE0hBJ2H3vOUszN
         jLnQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1786177361; x=1786782161; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aRXS8tM+rb30ygIbdTjOMxib33mj9VgRC9Oyc94RXsk=;
        b=R/ZW55SVMbCmgwg/kAW8Y7x9tQLfHfDA+2cTa8riSJO9ECUvDSXckMBipMwNuz9Fxl
         Xvg0FOwWsE8uST/3ru7AZQd5Eoc9bJhAy8gB8I8saFzv0zVbFnwJtukpqEjjKLMrT/lp
         sXwGaajD9P3SQ8+2r5MgwHw5x4FvKkN6RS3tL8nh9Mk+WR8AN/koqVMY0tr1MJYgYPhL
         qzUxn+k8GWjYFc+Ez1QxxHwc9NUNBCinzFEIDvS09bLwcz5sqJ5gEmVIOE6VAbW+JomS
         +tc1qFDhe95TAWhzfCC2Yw/lWG+K+JATGMahdWJsCZSmwjS8tGt5Ou4sAd9qL93GMSN6
         jk5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786177361; x=1786782161;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aRXS8tM+rb30ygIbdTjOMxib33mj9VgRC9Oyc94RXsk=;
        b=ERmSYf/0MgVe9+m4GhhoQeVXFymdFXzBCYUGn6MfMHDdJOQAYiS/ParW6P9Z1exE/Y
         yd5koXH/NxuLFzViZZ6sQM7KUOz/4dC5JSJiPYfceVJ6YOf7ovoCRz+WB/ruyTrnXP8t
         Gq3kTl+wnarOcYCNtTFl6CbqWZ17pr0CbG62547HER3KjCQGSd88aMXUFUTh5exOExp8
         qCXTKhLeKh2DpAO/OhneECeZ/RJiywiYj+ZLgsXZRoDCT+pgc0pDdJxMD6p//4hw/n5u
         j89891cXTC3ZxgpUwFx+BfH4YuO3Rp0514XRzbixxkE8yj1CFdEBnhWTs+qEQqo19U8J
         IiLQ==
X-Forwarded-Encrypted: i=1; AHgh+RrYredDBIxq24xfnc+5uQeYbJzQGZQhFSJfQt9DOUqZedifSyXYh8+d7AjPgN+0YeowIX5rnMxjovk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxMZHc/qXeplnpp2LZMaVvoCaEtYb6GYwF5ZxAYoHsmNjVMIemk
	8Cd3H4E9bYAS95yOyqxGRy0sdI/FQxJ2d3dYXwfmf77KNGk8PD/TMu2HxCnfCQ9bTH3PHA7T+Vi
	H3fMd8m4ru7BdaFQcUlbDYU9fAvP/7Wxmzow4R0odjQ==
X-Gm-Gg: AR+sD11UTauu92fWiM/RUVoogFcVYnMjcc+VeygdvMG7Wp5D7zicL2QDOM/nz4m6BbQ
	GZOJn+801PYhquVbrz4zcpq2h8E39oGBth+0pmw2XWYC4qts/t2On1xG4FqGHGqoPB8xgrfWtJX
	15V01q4OiRZo8dz4JAQItnx0FGVOuPH0G/PgB5bSIdwKTpooADQCmc7X/tsTwJyqWpmjlYmGkHc
	Hr86a88SPc/QVA4qtMa+0uUaDrmj1xO7gOh78FV7SpPAk/crxRb7s7VRQ+XXlX0E6uUQBV6cast
	XieLjNq+Bf7uD+879nSqGDv38bkcRHMVlPMXkC7xk/1TRE42abJ1TodlRXe6r1GSWTqBKFHyYVd
	HvJBDTCmtLUjFPIRw/DXgAQ4XG31dSrsfsyFPtHH3QmH5FfZuFTgf5nfmlCCsI4hQoKkslm3RSf
	U=
X-Received: by 2002:a05:600c:314f:b0:497:fe58:d714 with SMTP id
 5b1f17b1804b1-4994e7baa31mr298099605e9.9.1786177360994; Sat, 08 Aug 2026
 01:22:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260718040000.010.826fe94e-caplitmus-rv@iscas.ac.cn>
In-Reply-To: <20260718040000.010.826fe94e-caplitmus-rv@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 8 Aug 2026 13:52:27 +0530
X-Gm-Features: AUfX_mzJLGOWo5ULHzUQYvejWaeDBnFMfy6noBsi8JH80jIcqgMsis0BI9D48ek
Message-ID: <CAAhSdy1Mkfekf5ViagmynJMVii10kFZO=XbgNe14pM_f7Yi78A@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Avoid one-word masks for SBI v0.1 all-harts
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_012243_181153_C13E25FD 
X-CRM114-Status: GOOD (  19.81  )
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

T24gU2F0LCBKdWwgMTgsIDIwMjYgYXQgMTA6MDnigK9BTSBQZW5ncGVuZyBIb3UgPHBlbmdwZW5n
QGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IEtWTSBhbHJlYWR5IHRyZWF0cyBhIE5VTEwgaGFydC1t
YXNrIHBvaW50ZXIgaW4gU0JJIHYwLjEgY2FsbHMgYXMgYWxsCj4gaGFydHMsIG1hdGNoaW5nIE9w
ZW5TQkkncyBsZWdhY3kgaGFuZGxpbmcuIFRoZSBjdXJyZW50IGhhbmRsZXIgYnVpbGRzIHRoYXQK
PiB0YXJnZXQgc2V0IGFzICgxVUwgPDwgb25saW5lX3ZjcHVzKSAtIDEgYmVmb3JlIGl0ZXJhdGlu
ZyB0aGUgbWFzay4KPgo+IFRoYXQgZXhwcmVzc2lvbiBzaGlmdHMgYnkgdGhlIHR5cGUgd2lkdGgg
b25jZSB0aGUgVk0gaGFzIEJJVFNfUEVSX0xPTkcKPiBvbmxpbmUgdkNQVXMsIGFuZCBhIHNpbmds
ZSB3b3JkIGNhbm5vdCByZXByZXNlbnQgbGFyZ2VyIFZNcy4gQSBjb3VudC1iYXNlZAo+IG1hc2sg
YWxzbyBzZWxlY3RzIHRoZSB3cm9uZyBJRHMgd2hlbiB2Q1BVIElEcyBhcmUgc3BhcnNlLgo+Cj4g
SGFuZGxlIFNFTkRfSVBJIHdpdGggYSBOVUxMIGhhcnQtbWFzayBieSBpdGVyYXRpbmcgYWxsIG9u
bGluZSB2Q1BVcwo+IGRpcmVjdGx5LiBGb3IgcmVtb3RlIGZlbmNlIGNhbGxzLCB1c2UgdGhlIGV4
aXN0aW5nIGhiYXNlID09IC0xVUwKPiBjb252ZW50aW9uIHNvIHRoZSBjb21tb24gZmVuY2UgcmVx
dWVzdCBoZWxwZXIgdGFyZ2V0cyB0aGUgd2hvbGUgVk0KPiB3aXRob3V0IGNvbnN1bHRpbmcgaG1h
c2suCj4KPiBOb24tTlVMTCBndWVzdCBoYXJ0IG1hc2tzIGtlZXAgdGhlIGV4aXN0aW5nIHYwLjEg
YmVoYXZpb3IuCj4KPiBGaXhlczogYTA0NmMyZDg1NzhjICgiUklTQy1WOiBLVk06IFJlb3JnYW5p
emUgU0JJIGNvZGUgYnkgbW92aW5nIFNCSSB2MC4xIHRvIGl0cyBvd24gZmlsZSIpCj4gU2lnbmVk
LW9mZi1ieTogUGVuZ3BlbmcgSG91IDxwZW5ncGVuZ0Bpc2Nhcy5hYy5jbj4KCkxHVE0uCgpSZXZp
ZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGlzIHBh
dGNoIGZvciBMaW51eC03LjMKClRoYW5rcywKQW51cAoKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3Zt
L3ZjcHVfc2JpX3YwMS5jIHwgNTIgKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3YwMS5jIGIvYXJjaC9yaXNjdi9r
dm0vdmNwdV9zYmlfdjAxLmMKPiBpbmRleCBjOWMzMjNkNDU3N2E5Li5kZTU0NGVhM2YyOGRjIDEw
MDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3YwMS5jCj4gKysrIGIvYXJjaC9y
aXNjdi9rdm0vdmNwdV9zYmlfdjAxLmMKPiBAQCAtMTYsOCArMTYsOSBAQAo+ICBzdGF0aWMgaW50
IGt2bV9zYmlfZXh0X3YwMV9oYW5kbGVyKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2
bV9ydW4gKnJ1biwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBr
dm1fdmNwdV9zYmlfcmV0dXJuICpyZXRkYXRhKQo+ICB7Cj4gLSAgICAgICB1bG9uZyBobWFzazsK
PiAtICAgICAgIGludCBpLCByZXQgPSAwOwo+ICsgICAgICAgdWxvbmcgaGJhc2UgPSAwLCBobWFz
azsKPiArICAgICAgIHVuc2lnbmVkIGxvbmcgaTsKPiArICAgICAgIGludCByZXQgPSAwOwo+ICAg
ICAgICAgdTY0IG5leHRfY3ljbGU7Cj4gICAgICAgICBzdHJ1Y3Qga3ZtX3ZjcHUgKnJ2Y3B1Owo+
ICAgICAgICAgc3RydWN0IGt2bSAqa3ZtID0gdmNwdS0+a3ZtOwo+IEBAIC00NiwyMCArNDcsMjUg
QEAgc3RhdGljIGludCBrdm1fc2JpX2V4dF92MDFfaGFuZGxlcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsIHN0cnVjdCBrdm1fcnVuICpydW4sCj4gICAgICAgICAgICAgICAgIHJldCA9IGt2bV9yaXNj
dl92Y3B1X3Vuc2V0X2ludGVycnVwdCh2Y3B1LCBJUlFfVlNfU09GVCk7Cj4gICAgICAgICAgICAg
ICAgIGJyZWFrOwo+ICAgICAgICAgY2FzZSBTQklfRVhUXzBfMV9TRU5EX0lQSToKPiAtICAgICAg
ICAgICAgICAgaWYgKGNwLT5hMCkKPiArICAgICAgICAgICAgICAgaWYgKGNwLT5hMCkgewo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIGhtYXNrID0ga3ZtX3Jpc2N2X3ZjcHVfdW5wcml2X3JlYWQo
dmNwdSwgZmFsc2UsIGNwLT5hMCwgdXRyYXApOwo+IC0gICAgICAgICAgICAgICBlbHNlCj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgaG1hc2sgPSAoMVVMIDw8IGF0b21pY19yZWFkKCZrdm0tPm9u
bGluZV92Y3B1cykpIC0gMTsKPiAtICAgICAgICAgICAgICAgaWYgKHV0cmFwLT5zY2F1c2UpCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gLQo+IC0gICAgICAgICAgICAgICBmb3Jf
ZWFjaF9zZXRfYml0KGksICZobWFzaywgQklUU19QRVJfTE9ORykgewo+IC0gICAgICAgICAgICAg
ICAgICAgICAgIHJ2Y3B1ID0ga3ZtX2dldF92Y3B1X2J5X2lkKHZjcHUtPmt2bSwgaSk7Cj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgaWYgKCFydmNwdSkKPiAtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbnRpbnVlOwo+IC0gICAgICAgICAgICAgICAgICAgICAgIHJldCA9IGt2bV9y
aXNjdl92Y3B1X3NldF9pbnRlcnJ1cHQocnZjcHUsIElSUV9WU19TT0ZUKTsKPiAtICAgICAgICAg
ICAgICAgICAgICAgICBpZiAocmV0IDwgMCkKPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAo
dXRyYXAtPnNjYXVzZSkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+
ICsKPiArICAgICAgICAgICAgICAgICAgICAgICBmb3JfZWFjaF9zZXRfYml0KGksICZobWFzaywg
QklUU19QRVJfTE9ORykgewo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcnZjcHUg
PSBrdm1fZ2V0X3ZjcHVfYnlfaWQodmNwdS0+a3ZtLCBpKTsKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGlmICghcnZjcHUpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbnRpbnVlOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0
ID0ga3ZtX3Jpc2N2X3ZjcHVfc2V0X2ludGVycnVwdChydmNwdSwgSVJRX1ZTX1NPRlQpOwo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHJldCA8IDApCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIH0KPiArICAgICAgICAgICAgICAgfSBlbHNlIHsKPiArICAgICAgICAgICAgICAgICAgICAg
ICBrdm1fZm9yX2VhY2hfdmNwdShpLCBydmNwdSwga3ZtKSB7Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICByZXQgPSBrdm1fcmlzY3ZfdmNwdV9zZXRfaW50ZXJydXB0KHJ2Y3B1LCBJ
UlFfVlNfU09GVCk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAocmV0IDwg
MCkKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICAgICAg
ICAgIGJyZWFrOwo+ICAgICAgICAgY2FzZSBTQklfRVhUXzBfMV9TSFVURE9XTjoKPiBAQCAtNzAs
MjkgKzc2LDMxIEBAIHN0YXRpYyBpbnQga3ZtX3NiaV9leHRfdjAxX2hhbmRsZXIoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuLAo+ICAgICAgICAgY2FzZSBTQklfRVhU
XzBfMV9SRU1PVEVfRkVOQ0VfSToKPiAgICAgICAgIGNhc2UgU0JJX0VYVF8wXzFfUkVNT1RFX1NG
RU5DRV9WTUE6Cj4gICAgICAgICBjYXNlIFNCSV9FWFRfMF8xX1JFTU9URV9TRkVOQ0VfVk1BX0FT
SUQ6Cj4gLSAgICAgICAgICAgICAgIGlmIChjcC0+YTApCj4gKyAgICAgICAgICAgICAgIGlmIChj
cC0+YTApIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBobWFzayA9IGt2bV9yaXNjdl92Y3B1
X3VucHJpdl9yZWFkKHZjcHUsIGZhbHNlLCBjcC0+YTAsIHV0cmFwKTsKPiAtICAgICAgICAgICAg
ICAgZWxzZQo+IC0gICAgICAgICAgICAgICAgICAgICAgIGhtYXNrID0gKDFVTCA8PCBhdG9taWNf
cmVhZCgma3ZtLT5vbmxpbmVfdmNwdXMpKSAtIDE7Cj4gKyAgICAgICAgICAgICAgIH0gZWxzZSB7
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaGJhc2UgPSAtMVVMOwo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGhtYXNrID0gMDsKPiArICAgICAgICAgICAgICAgfQo+ICAgICAgICAgICAgICAg
ICBpZiAodXRyYXAtPnNjYXVzZSkKPiAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPgo+
ICAgICAgICAgICAgICAgICBpZiAoY3AtPmE3ID09IFNCSV9FWFRfMF8xX1JFTU9URV9GRU5DRV9J
KQo+IC0gICAgICAgICAgICAgICAgICAgICAgIGt2bV9yaXNjdl9mZW5jZV9pKHZjcHUtPmt2bSwg
MCwgaG1hc2spOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGt2bV9yaXNjdl9mZW5jZV9pKHZj
cHUtPmt2bSwgaGJhc2UsIGhtYXNrKTsKPiAgICAgICAgICAgICAgICAgZWxzZSBpZiAoY3AtPmE3
ID09IFNCSV9FWFRfMF8xX1JFTU9URV9TRkVOQ0VfVk1BKSB7Cj4gICAgICAgICAgICAgICAgICAg
ICAgICAgdm1pZCA9IFJFQURfT05DRSh2Y3B1LT5rdm0tPmFyY2gudm1pZC52bWlkKTsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICBpZiAoY3AtPmExID09IDAgJiYgY3AtPmEyID09IDApCj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBrdm1fcmlzY3ZfaGZlbmNlX3Z2bWFfYWxsKHZj
cHUtPmt2bSwgMCwgaG1hc2ssIHZtaWQpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAga3ZtX3Jpc2N2X2hmZW5jZV92dm1hX2FsbCh2Y3B1LT5rdm0sIGhiYXNlLCBobWFzaywgdm1p
ZCk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgZWxzZQo+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAga3ZtX3Jpc2N2X2hmZW5jZV92dm1hX2d2YSh2Y3B1LT5rdm0sIDAsIGhtYXNr
LCBjcC0+YTEsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBrdm1fcmlzY3ZfaGZl
bmNlX3Z2bWFfZ3ZhKHZjcHUtPmt2bSwgaGJhc2UsIGhtYXNrLCBjcC0+YTEsCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNwLT5hMiwg
UEFHRV9TSElGVCwgdm1pZCk7Cj4gICAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgdm1pZCA9IFJFQURfT05DRSh2Y3B1LT5rdm0tPmFyY2gudm1pZC52bWlk
KTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoY3AtPmExID09IDAgJiYgY3AtPmEyID09
IDApCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBrdm1fcmlzY3ZfaGZlbmNlX3Z2
bWFfYXNpZF9hbGwodmNwdS0+a3ZtLCAwLCBobWFzaywKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGt2bV9yaXNjdl9oZmVuY2VfdnZtYV9hc2lkX2FsbCh2Y3B1LT5rdm0sIGhiYXNl
LCBobWFzaywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBjcC0+YTMsIHZtaWQpOwo+ICAgICAgICAgICAgICAgICAgICAgICAg
IGVsc2UKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGt2bV9yaXNjdl9oZmVuY2Vf
dnZtYV9hc2lkX2d2YSh2Y3B1LT5rdm0sIDAsIGhtYXNrLAo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAga3ZtX3Jpc2N2X2hmZW5jZV92dm1hX2FzaWRfZ3ZhKHZjcHUtPmt2bSwgaGJh
c2UsIGhtYXNrLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNwLT5hMSwgY3AtPmEyLCBQQUdFX1NISUZULAo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNw
LT5hMywgdm1pZCk7Cj4gICAgICAgICAgICAgICAgIH0KPiAtLQo+IDIuNDMuMAo+CgotLSAKa3Zt
LXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
