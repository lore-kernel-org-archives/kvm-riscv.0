Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F46C54F51
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 08:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eIQJ0VxiNvWfOifvvO5eSREbOf/HYlqjrmepwE6sn+g=; b=wT1prT+HV6mo4F
	AetKp14qvPdXbVH4/ZYf3nGOM8C3XXwAsCq4ZBfTIqNqP4DEk6lF08ixzcpZ6TTDKANnjq2yyG96t
	LTYjYmmthnAk9aXFes/vBteH+yxxOQMIZW8Pzl+KMCMzxvPx7qUMlqxaHS0AS5jClOlFzIu9ioT5t
	qLrSGPrmBedXSxvw4s/ha79Z3T1oOR5aXm7FbSYETLWP7cScjx0Lf6akR5UjiXwxBUuY2xQywA681
	pdhtzGwD+287eEZdZtvSSSnlr03X1b6JQg2GGiCircgBFgg2P4Yqhk6MJKx8pOV+4oBnlUCEbHXej
	lgmAYvjFfWZYQ5yStjLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozFg-00000007Bl5-3FPF;
	Wed, 29 Jul 2026 08:02:56 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozFd-00000007Bjh-1QM7
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 08:02:54 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso2895935e9.3
        for <kvm-riscv@lists.infradead.org>; Wed, 29 Jul 2026 01:02:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785312171; cv=none;
        d=google.com; s=arc-20260327;
        b=GP/KxbTsmvm8WlRlWN5LLf5vTyMVh6+09lgPSXg1JC4DNti893UGajWcI3aw1OFiY1
         p09QLWed5jkg754kYHi5AwdXgVopL6KqocKxA4BJJx5dNSfo9qjySYtnPMfNNug1w44C
         B64S5R0+AqmfGcC+jSllSfF49yOpekd6Srl9r4moeEMsrzqtYoZ1bx8E3Sqg5OWdBt61
         MCHGFiHNBEoM5Mzue3dIPXfin7xr0QfSby+vnARujL7VmvdMd6xgSYRaUeKHvjcPEsu/
         DKL59X2CuAHoFScQtrs7fsSDn7F9A1CFyOq6LT5OZdsfMK0ci5yZc8tF3Dmoh+6ycIZ6
         FfRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KUGHARkb/NyRoNdj9PaR5oVTMK44ZfhRPJfOUUN230Q=;
        fh=7TEQFefBFc40TzjJvZtJMr9GxEVCdyIF16vpBNdCuj8=;
        b=hisQZwyF7gcEHVH7MrHOdtcknGiqKGHCTF6y0mCu9icu2IA2Qb6TYiapXDFqKHU1Xr
         138ERb8CHTlqHDOvPGHOggBUDxInBbrHmSoSOSdmYV+7UDxAXle+vNoGLBzP+bs+5XIP
         X5GkDkLFrZZTowgotcCg9Gu3vt1a+ueB+8BK0OyegxfDF9aDUyws3tHcRvYjnaMLEpaW
         ggs4ykM0M0xMqdWvlbSXQkGAlTCNPWc4N+J9nrCscdd/jSm4Hbd7czpO5a2NvxHwg7r+
         L2GulU3YL/nKJAXVYTOxJOacvDQlrewOk0JNh2S5otJH+CfKLpCr+DXkufJHfOOh04YA
         zBLQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785312171; x=1785916971; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KUGHARkb/NyRoNdj9PaR5oVTMK44ZfhRPJfOUUN230Q=;
        b=k+UBOpklMXHS0vFUQjbsFtm+HIOtBDdz7sVd97KkjkJLhGGr7rezAAJlwvixGgXWo2
         sGy72RQ9txiWP3gh8RWgETnt8Q4az99CKv9Yzp/9mqGoWIDtLIY1j6QN5HT4sPFb0OrL
         hB5RVwsjNnfYzWR6zfovxafwN72owcFf6OS9qzYqeRxQToq6ozGnjE++wspM12ECwg8q
         sD9oJ8DbnAE2qLMPGJzsJ03otCpOYiFi8eMbLWbNNpNi8pmKGpnhBcsEkWKvfh4b3Avl
         u3JVGRwE8SfXMHp/FClcI+yxH2757tm4aPi0I8iUF6a4ddVsSJ5x557bOzTdBc4Zl0jz
         mh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785312171; x=1785916971;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KUGHARkb/NyRoNdj9PaR5oVTMK44ZfhRPJfOUUN230Q=;
        b=nmMR4lOdZxyEkZEYPXfYEtYlcJ9SZJZPI6t+2CzZ4KK5jwZJ4HMkXGTawCm2jOtykA
         QWn+TmgF7mNWv7JYBIa/8UWsxgSdoB82htQdTFw0yGfhkSeBfuvXnCQlYI0I9CNjRc8I
         tk2vJhURpvHoIlbK9X7QftusLQgufitjYx28ib/qKLEx1lXZcxWtWMehZm2eHHLbZPv7
         jN6tPlBNUt1GvlQVSVO64oFF/Jtn2PSYDdHgFPRTSIPvjHK+v+nQQttW8zLaQXFn5UwO
         SAm/WBRHD4oD7DHvowArq9EN4iA7s7Jz0djoph6yZDXwN5xIOQ7SVbKqtaTqW0yPFAAw
         Eucw==
X-Forwarded-Encrypted: i=1; AHgh+Rq0aifZWG9x2EEtnKb4XfmW3W0ZFxTsB1qW32Txq8qsamoX+rwH9rgBojRdnUzSqK5W6f1DC2El1Q4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4F/k3poOjo0x5jZr2mk1Asw5We9tC2U9mIqJzLvpJ6hIlfgkp
	44KS6hiGH7F1rREH0EwQqDH4LS25ZwOxRFu6QJYvANd5F4e/xWezwuC3vJRSA3i7k7I5CzRkE15
	1yBfmN9oUG2epAmGspGCUsI//uMotWXgLjmS14PMmqA==
X-Gm-Gg: AR+sD10CGPtns60jt/VWYUwd2TOzCDV5x/uMpcr+hIcXrxcZSaOyTUtD0xtpEEq67hi
	wsbzdJWf5O+XR/+Kgegf7t+6py2aiBONCN/PW8+cwKC2Q62ve6yBVGgf+Nykg9uP1y0DW4Qto2C
	44AVI0mKQGpTQ+T/bS0ZrxbhYsygPemn+WNiUy5W7y/Oqnf6ohcFMyjJ/sP3Fo3UIQRoq1w5Jtf
	b+lrvjKGVCuRJ2NY7Suy53Np+z+QWLhi7CKtDZ8qV2wwsCER+6QjD/Qvby9L9/w4AiThuNzTjWa
	YM/5QXOdIZmyhSDECClKndwrqUsnoZDNgA4CKGACDSgkQh5r4lXH/aoyBlvrmZ11MnSLiASUObD
	N+lL0Wf78SVuvs+oIhRALxAjhpZJF9doq5wptHHVQqgLoTmVkZsZxKquntJ4TKuw=
X-Received: by 2002:a05:600c:3146:b0:495:4cb6:71cc with SMTP id
 5b1f17b1804b1-496c6413090mr60244765e9.5.1785312171184; Wed, 29 Jul 2026
 01:02:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260706021154.210289-1-inochiama@gmail.com> <20260706021154.210289-4-inochiama@gmail.com>
In-Reply-To: <20260706021154.210289-4-inochiama@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 29 Jul 2026 13:32:40 +0530
X-Gm-Features: AUfX_mwSxFjTy59usX_zUYG_2NAipnz8XUOKZh1hddj4nec-XezM7JKOT1LvP0A
Message-ID: <CAAhSdy3qnvWF1cdxJxnJxR9jf0_BUpKbauNAuJcY_AAVaJw9AQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] RISC-V: KVM: Reset the SBI extension when disable it
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_010253_445718_0ACBDEDA 
X-CRM114-Status: GOOD (  18.85  )
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

T24gTW9uLCBKdWwgNiwgMjAyNiBhdCA3OjQy4oCvQU0gSW5vY2hpIEFtYW90byA8aW5vY2hpYW1h
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGUgU0JJIGV4dGVuc2lvbiB2YWxpZGF0aW9uIGNhbGxi
YWNrIGNhbiBvbmx5IGZpeCB0aGUgcGFyYW1ldGVyIGlmCj4gdGhlIGV4dGVuc2lvbiBpcyBlbmFi
bGVkLiBIb3dldmVyLCBpZiB0aGUgZXh0ZW5zaW9uIGlzIGRpc2FibGVkIGFmdGVyCj4gbW9kaWZ0
eSBzb21lIHBhcmFtZXRlcnMsIHRoZSBzdGF0ZSBvZiB0aGUgZXh0ZW5zaW9uIGlzIHN0aWxsIGJy
b2tlbi4KPgo+IFJlc2V0IHRoZSBleHRlbnNpb24gd2hlbiB0aGUgZXh0ZW5pb24gaXMgZGlzYWJs
ZWQgc28gaXQgY2FuIGhhdmUKCnMvZXh0ZW5pb24vZXh0ZW5zaW9uLwoKPiBhIGNsZWFyIGNvbnRl
eHQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBJbm9jaGkgQW1hb3RvIDxpbm9jaGlhbWFAZ21haWwuY29t
Pgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jIHwgMTAgKysrKysrKysrKwo+ICAx
IGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva3ZtL3ZjcHVfc2JpLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jCj4gaW5kZXggYjcz
N2U5YTdhMTJhLi4zZWI3YjdjNTcwNTkgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNw
dV9zYmkuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKPiBAQCAtMjIxLDYgKzIy
MSw3IEBAIHN0YXRpYyBpbnQgcmlzY3ZfdmNwdV9zZXRfc2JpX2V4dF9zaW5nbGUoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LAo+ICB7Cj4gICAgICAgICBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2NvbnRleHQg
KnNjb250ZXh0ID0gJnZjcHUtPmFyY2guc2JpX2NvbnRleHQ7Cj4gICAgICAgICBjb25zdCBzdHJ1
Y3Qga3ZtX3Jpc2N2X3NiaV9leHRlbnNpb25fZW50cnkgKnNleHQ7Cj4gKyAgICAgICBjb25zdCBz
dHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiAqZXh0Owo+Cj4gICAgICAgICBpZiAocmVnX3Zh
bCAhPSAxICYmIHJlZ192YWwgIT0gMCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
Cj4gQEAgLTIyOSw2ICsyMzAsMTUgQEAgc3RhdGljIGludCByaXNjdl92Y3B1X3NldF9zYmlfZXh0
X3NpbmdsZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4gICAgICAgICBpZiAoIXNleHQgfHwgc2Nv
bnRleHQtPmV4dF9zdGF0dXNbc2V4dC0+ZXh0X2lkeF0gPT0gS1ZNX1JJU0NWX1NCSV9FWFRfU1RB
VFVTX1VOQVZBSUxBQkxFKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT0VOVDsKPgo+ICsg
ICAgICAgZXh0ID0gc2V4dC0+ZXh0X3B0cjsKPiArCj4gKyAgICAgICBpZiAoIXJlZ192YWwgJiYg
c2NvbnRleHQtPmV4dF9zdGF0dXNbc2V4dC0+ZXh0X2lkeF0gPT0gS1ZNX1JJU0NWX1NCSV9FWFRf
U1RBVFVTX0VOQUJMRUQpIHsKPiArICAgICAgICAgICAgICAgaWYgKGV4dC0+cmVzZXQpIHsKPiAr
ICAgICAgICAgICAgICAgICAgICAgICBleHQtPnJlc2V0KHZjcHUpOwo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIHZjcHUtPmFyY2guY3NyX2RpcnR5ID0gdHJ1ZTsKCkxldCdzIG5vdCBibGluZGx5
IHNldCAiY3NyX2RpcnR5IiB3aGVuIGFueSBTQkkgZXh0ZW5zaW9uIGlzIGRpc2FibGVkLAppbnN0
ZWFkIHdlIHNob3VsZCBzZXQgImNzcl9kaXJ0cnkiIGluIGt2bV9zYmlfZXh0X2Z3ZnRfcmVzZXQo
KSAoanVzdApsaWtlIHdlIGRvIGluIGt2bV9zYmlfZXh0X2Z3ZnRfc2V0X3JlZygpKS4KCj4gKyAg
ICAgICAgICAgICAgIH0KPiArICAgICAgIH0KPiArCj4gICAgICAgICBzY29udGV4dC0+ZXh0X3N0
YXR1c1tzZXh0LT5leHRfaWR4XSA9IChyZWdfdmFsKSA/Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgS1ZNX1JJU0NWX1NCSV9FWFRfU1RBVFVTX0VOQUJMRUQgOgo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIEtWTV9SSVNDVl9TQklfRVhUX1NUQVRVU19ESVNBQkxFRDsKPiAtLQo+IDIuNTUuMAo+
CgpSZWdhcmRzLApBbnVwCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2t2bS1yaXNjdgo=
