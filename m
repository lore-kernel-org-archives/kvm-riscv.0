Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0038C88E67
	for <kvm-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 05:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+6ZKd0ta3AGdw8lX0sbnG2vX5rVG44XjZJYRGXNWxn8=; b=hH/46N4+fUMZ54
	X6ArgEStI0nBGRilaCUEIRnUGjG4pTIA6b0O0cqaf3TPLaFJ3gM6RQ1g2SKUkR1vN+ZN6AGtyCJEs
	sclKIjopuseLrIuQarekGbuuib2Od/2PCUawgpz/Aw6KSPwO7MhdUVq27jWin7cWf0xb6cmPQqrK7
	69wY3IPyTsabT3C7GnbFBbvdykiOCow0J3kQWErQF+xj4SiIxxYmPmolvVnF9iLxlf7AAifA1KEKZ
	cTsEU7zdmp6ZbnDxF0aagFjbf1Z27Cvooyo6/YHClvZ/zh/51EAz0ywCwAa5cPb1E7K03ynhVYV6K
	HsRv+1Rl5Od9Oj6J9dqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5z1J-00000002MEU-0XlR;
	Mon, 14 Sep 2026 05:14:21 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5z1F-00000002MDe-18wA
	for kvm-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 05:14:19 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-49d05d51553so23429475e9.2
        for <kvm-riscv@lists.infradead.org>; Sun, 13 Sep 2026 22:14:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789362855; cv=none;
        d=google.com; s=arc-20260327;
        b=XHiuUdAUvvexqmtdGRSt7S3lnyEbh4MGG/NMFWfes3enQ2a+efZLfArAzE+qODmKtu
         3nUPTefP3Jk8BP6+OUiVr2UYUsYuYHMc6Nar2aKvCR8Bpv2NaMrNGYo2yr6f4PMwYTUG
         AVsBGxbgjhu2SKckoQg9gfAIcPT/8hQGG7cpIasOE8VoywurwS9yP0OwwiPVTFn+e9fw
         goyMFvCv+INNxgHdFvkUkuJ8qOWnWjKqNvzFF8CGoVupUfyDPXWBjUDsx5Xbda9rB3kt
         /uwvA9gAkHWtVTz0eyzC8AzJnfg28q/KS5xyjgiG/2rkEhyG6yL5G7FxtZnKPxbi+sLY
         bO1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u1vq0Y3VWCX7lyWdlee9zNWImptkP5hflAUk9JcRAgU=;
        fh=8Uv/rI3MjVPv0uJtiHvtPL3IjZyMHxAHAiZzpbMP2Qc=;
        b=jkWsJKuSu1ZDSLHLYLXXlMCXTRLvv5I1npvyPMlOuYIou/DbMkgsZiL1n51cLidbpE
         zcI3rNjKKjiZUrZq39rvtMX1PY3JpBgeputVEAST664Z2NT1ibkdBlLn/g3HEW2liysQ
         E8iyS2bORmbX5K1waphyabt9fzq0CHxNeJFwO1p/6OMfzDbPx8plut1w7j5M9FfJL+eY
         HgDEzdgb6l+uxnB+zW9m8+Gp/Xe3n/txRK3TdlXMKhnBTWhe8ROjBjtSh/Fk+98dFnxx
         NmwG/1zEsu33SnU5U3n3HXeVaHhwl1oEytYlFf5x69CyOW5N8D1L7nRf8mIuHogaogP4
         omQw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789362855; x=1789967655; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u1vq0Y3VWCX7lyWdlee9zNWImptkP5hflAUk9JcRAgU=;
        b=G/pIMrb+XeHa4mBrWtI/gRU3Rf6IP99oOfsIcAlSLWjoUIuh7sTo/LIct1dwQDwvKH
         o2GFetIQEaNqUzegr3FCxy1rYLKpTXeRoS8zdY1GkcP1E6xqrnNTmKoFYs8rtKl09zHG
         FzV/YTRGJjvnQizuAcYQ5z8nkd2r/LqfUOopcFw5B8qZPrzOKbp8iU2T1dwqp0fc5Yvj
         wu5fd8+28XuE6qMVXX8UHvBQ6HGxhKBYrJet7uY/fDLZLf5oHbslxp2BUudd+dUvzLAl
         drtEW+NTPzsZw2Ykp8IU24h0PC9/SNIdArYhOSQRb8h4yccxO0j3ssEweSTq5zyUjkwD
         R+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789362855; x=1789967655;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u1vq0Y3VWCX7lyWdlee9zNWImptkP5hflAUk9JcRAgU=;
        b=k99WnvAU0xiBwddTqfAW1iBAD7MWUw5cUppEPe6KwiM2sPkTyLzp1qMaDGglLivMhg
         Tr8YuUqlrD4ejfTGVdpagZ2fqex13nBLa990vdBwJtl3LVMvrBJM+ClgwxWrCRehQw9D
         gb/cGVuoJqVCUGVUt/JoTv+e9o8SpC54jLdjj+YjfCrTDhjELIN0Lq8cvlHSEAyf/WyN
         H1FrQLoYzHFR0uak2lBRSwvn1VcHUiq9iUX80HdqxMwkhHpyrpLsWIuOU8KmcDH1se9h
         YmfFpyoNqNI5YOmD8jwAFwvzBikvE39bFr0ekVc6yTEoSb1QwZ378xcuAE+30jxikj9z
         Jiwg==
X-Forwarded-Encrypted: i=1; AKwUvBwOlzMXK7Z9s/rbh9B0a3+WywI724Tc8NnwKXaGFcAq7Jl44Cj9s4/PzKdfWSseFU1zAJ4Kfb8dRAI=@lists.infradead.org
X-Gm-Message-State: AFuF++ltZ3hCdAqyMUrmix6kaLadyMXUtUQBKr+lewfkbOwVzvHLXCLT
	LeW/kiRFaZZCv7vqSNeCKmcZNSQrMCe41NMkXZvopoR4gwAjegtXYce6NAeYOkqtnCvuNerLn3i
	dkCnGZRlYvH5VFl/64K1pzn7Hyd/tZjwfB7g2aQPxMA==
X-Gm-Gg: AYBFou2grF39/FOFXbobeifQairpWgZASUmCFaSuAYr8MtH6o8PBxB0RlSvh+KC2itG
	f+fZAkrrS5oWa/O/Vb2714mqbTYSxTrDmN6gO4J650Aw1RJVP8/VHpZpYJzgcIy/15eqdVNpiH+
	Ok4piTBYp6JmTyTYFT7jTZ4cDuQuHYyEdE0ZZAuoHw9mLbE6W+rg7+OfLyoTe7wRHS1qK+MmTE1
	iHNSJsJYk1kGJmCtNXKtKVSu2LChsJh4pQNFq3kmutworQCxg9KtjVmfk2T0jkeHCIgQK0owvii
	L1sjxO1J+vtFyXyR6ipgFIXjPrcRZfi9xCYiaAWgCr5e8TyLFzh4HUG+/XAGC6gee/cdCi6ggw4
	uf0u3DxRQ2McIVhaVADV1GCkqs8sfp3y4WvCJNGK5ev1SDUMVnLl2p46ElN9lGWUG1pJE1EsXXA
	==
X-Received: by 2002:a05:600c:19c9:b0:49e:6e7c:d895 with SMTP id
 5b1f17b1804b1-49e7a678d7dmr8979885e9.26.1789362855198; Sun, 13 Sep 2026
 22:14:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260914031146.446157-1-tanchi25@mails.ucas.ac.cn>
In-Reply-To: <20260914031146.446157-1-tanchi25@mails.ucas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 14 Sep 2026 10:44:04 +0530
X-Gm-Features: AcwNN1Xv9Q24Kz2JNPc5ElbJduPG-W_3pjLhuvmorF4ZD7AGszu1UnXv2VgFblg
Message-ID: <CAAhSdy3m8iBXiJF_=syKKm-JYpW3ou8P4FpWNB0_a-t+_dTuAg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix HSM hart status error propagation
To: Tan Chi <tanchi25@mails.ucas.ac.cn>
Cc: Atish Patra <atish.patra@linux.dev>, kvm-riscv@lists.infradead.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_221417_333400_ECA44BF9 
X-CRM114-Status: GOOD (  17.48  )
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

T24gTW9uLCBTZXAgMTQsIDIwMjYgYXQgODo0MuKAr0FNIFRhbiBDaGkgPHRhbmNoaTI1QG1haWxz
LnVjYXMuYWMuY24+IHdyb3RlOgo+Cj4ga3ZtX3NiaV9oc21fdmNwdV9nZXRfc3RhdHVzKCkgcmV0
dXJucyBTQklfRVJSX0lOVkFMSURfUEFSQU0gd2hlbgo+IHRoZSByZXF1ZXN0ZWQgaGFydCBkb2Vz
IG5vdCBleGlzdC4gSG93ZXZlciwgdGhlIEhBUlRfU1RBVFVTIGNhc2UKPiByZXR1cm5zIGZyb20g
dGhlIFNCSSBoYW5kbGVyIHdpdGhvdXQgc3RvcmluZyB0aGlzIGVycm9yIGluCj4gcmV0ZGF0YS0+
ZXJyX3ZhbC4KPgo+IEFzIGEgcmVzdWx0LCBhIGd1ZXN0IHF1ZXJ5aW5nIHRoZSBzdGF0dXMgb2Yg
YSBub24tZXhpc3RlbnQgaGFydAo+IG9ic2VydmVzIFNCSV9TVUNDRVNTIGluc3RlYWQgb2YgU0JJ
X0VSUl9JTlZBTElEX1BBUkFNLgo+Cj4gVXNlIHRoZSBjb21tb24gU0JJIGVycm9yIGhhbmRsaW5n
IHBhdGggZm9yIEhBUlRfU1RBVFVTIGFmdGVyCj4gc2F2aW5nIGEgdmFsaWQgaGFydCBzdGF0ZSBp
biByZXRkYXRhLT5vdXRfdmFsLiBUaGlzIHByZXNlcnZlcwo+IHRoZSByZXR1cm5lZCBlcnJvciB3
aGVuIGt2bV9zYmlfaHNtX3ZjcHVfZ2V0X3N0YXR1cygpIGZhaWxzLgo+Cj4gRml4ZXM6IGJhZTBk
ZmQ3NGUwMSAoIlJJU0MtVjogS1ZNOiBNb2RpZnkgU0JJIGV4dGVuc2lvbiBoYW5kbGVyIHRvIHJl
dHVybiBTQkkgZXJyb3IgY29kZSIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBBc3Np
c3RlZC1ieTogTExNCj4gU2lnbmVkLW9mZi1ieTogVGFuIENoaSA8dGFuY2hpMjVAbWFpbHMudWNh
cy5hYy5jbj4KCkdvb2QgY2F0Y2guCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFp
bmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGlzIHBhdGNoIGFzIGZpeCBmb3IgTGludXgtNy4zLXJjWAoK
VGhhbmtzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9oc20uYyB8IDQg
KystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2hzbS5jIGIvYXJjaC9yaXNj
di9rdm0vdmNwdV9zYmlfaHNtLmMKPiBpbmRleCBmMjYyMDdmODRiYWIuLjA2YTE1NjI5YzI2YiAx
MDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9oc20uYwo+ICsrKyBiL2FyY2gv
cmlzY3Yva3ZtL3ZjcHVfc2JpX2hzbS5jCj4gQEAgLTk1LDkgKzk1LDkgQEAgc3RhdGljIGludCBr
dm1fc2JpX2V4dF9oc21faGFuZGxlcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1f
cnVuICpydW4sCj4gICAgICAgICAgICAgICAgIHJldCA9IGt2bV9zYmlfaHNtX3ZjcHVfZ2V0X3N0
YXR1cyh2Y3B1KTsKPiAgICAgICAgICAgICAgICAgaWYgKHJldCA+PSAwKSB7Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgcmV0ZGF0YS0+b3V0X3ZhbCA9IHJldDsKPiAtICAgICAgICAgICAgICAg
ICAgICAgICByZXRkYXRhLT5lcnJfdmFsID0gMDsKPiArICAgICAgICAgICAgICAgICAgICAgICBy
ZXQgPSAwOwo+ICAgICAgICAgICAgICAgICB9Cj4gLSAgICAgICAgICAgICAgIHJldHVybiAwOwo+
ICsgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgIGNhc2UgU0JJX0VYVF9IU01fSEFSVF9T
VVNQRU5EOgo+ICAgICAgICAgICAgICAgICBzd2l0Y2ggKGxvd2VyXzMyX2JpdHMoY3AtPmEwKSkg
ewo+ICAgICAgICAgICAgICAgICBjYXNlIFNCSV9IU01fU1VTUEVORF9SRVRfREVGQVVMVDoKPgo+
IGJhc2UtY29tbWl0OiBkZjI5MDgwOTBjZGEzNjhiMDFmZjQzNzA5ZjUxODkwMDc2YzU2MTU3Cj4g
LS0KPiAyLjUzLjAKPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9rdm0tcmlzY3YK
