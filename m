Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE46B10ED677
	for <kvm-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 13:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yqiU78JUrloQSJTZs9dtUcUc2H9oAJUa93hUWrCfuzI=; b=fVkymvjNIrAR2b
	xpVZg+IEHAdDd475jsKduPGuyuQb2549fPnP0qcD9HHv5I++HvK6ghP1AsiOv+whAcH9LbitvKgPd
	XHM8YTSV+gSowqBt4Ea+l1tsyclZ39HERA3nb6vXmWKF4VYeqi2ZQGzqtVjUpQmVHz5DqpZ4kgspD
	J/dxLVBVb50pgLUpEwKDgbWf3g4PdGxjQMY5STPErBLC+gfbqPwTfwiFbZ17YZM5tMv9824/JMrob
	s6b9uHyPvP/C6KRx7hMcnfUvlswSpS2oLvIWOwB216eAZOu/mNWQMN4Uh1MCoi3aMzOx5LkyGWm1W
	fpW4TmmXlOTh6kui8RQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w673B-00000007Qr9-0a2X;
	Fri, 27 Mar 2026 13:16:33 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6738-00000007Qpt-1CsZ
	for kvm-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 13:16:31 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-467e044082dso794193b6e.1
        for <kvm-riscv@lists.infradead.org>; Fri, 27 Mar 2026 06:16:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774617389; cv=none;
        d=google.com; s=arc-20240605;
        b=OfWy6jJkgE8dqEGy5J7w21YurHyVnkN/eT7yReNuzD7r5fr/5L3tDaVRFvLurFt6Sk
         l+RFSEsJFQp+RqUH61+lDjK3XhTON1VwsMW3laH4Sdzkxt6s5zBuj2nJUgKoBxcxGxHN
         +PXxxtHotSyyv61HuDB8CSlGhJafwIoqkdxgnf53xDkNiCqLiRSzPIdvEyZLGkogC8OX
         ZfQUBOGYf8btQtgXcwsgIVddrFO0SFk07rizxtX9vSiFqrydUwfvQBMLSH4hIj2YDhVS
         T8cQ808xsx8v1pV0WJrqeuUzBxvcNFlDUVVObn9ZhslVCZ2rOgzagfGvd7ww5urxeOMy
         SAlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LxsmBS0GOSp0jQyHQNaHHHPYwd9SwbtGqsQ8nHJmtNM=;
        fh=WC2otd1lGG3fd1yvqm37Fm59P6whjZB0MhatZCwV+Kg=;
        b=jVWJSb2LP2Rzm4o3eMC+iYiYzO8tjkYm8pP/8sr0NmPgctKnbgjG/qLxohU0bLK8dW
         WmVpR9yTnll8WyYnhc3vcIOZJ97hk1SwXFqHNcvd0QF6kjM1idA0HbocxTN53H6sl/XB
         x170tbUnKa5jgLl2GY+Nj3/Dmp9iUDqkBl3cTBPkdUGr69+JqD6EVlcFu9D92Ikw3vwp
         vQns5Evvdcj4Db45ee7xO7Sxq7AneOCLD2/sdMw3UgeUR+zk++lcXpSrfKtAbnIfa0bv
         PEVvcNBXCU4bfzrqfhhT7j+EgIraY9OOnC0H9jAUqE0twEXEpmu7OADTb9mxeVTQsPoz
         lyIw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1774617389; x=1775222189; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxsmBS0GOSp0jQyHQNaHHHPYwd9SwbtGqsQ8nHJmtNM=;
        b=2ZZ1ejMMSlT7q6m7uTFAoDg2VOpgvDhqnr1ihgJDFhRkm34RujPSxQTGVNKkTOGAEZ
         tKgGD3+jqKCLjelUELq8ZmwtSG5jJNiIxXaDNQz1yc8bTIrncLdVPCNATH4EqBe27Q9N
         PMDIEl6wpz3BsB+IfOsrXZRYqZqdu6WXi5DzX0fc2qdoYWA9LLjlyMDDmEyvWtUclrAv
         CddYulAjM8EP+JLNm3xvjd9tCydO5SUmsyK57EHsHN0i8gSbyymZeokmZr12/whIMTe+
         tLTh/7vYiQhZL50CmndJ6LMY3PRbr6t+OsMqQ0Oe0xjxFDi2XW7vYE2HeAArOcXEJjjP
         aAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774617389; x=1775222189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LxsmBS0GOSp0jQyHQNaHHHPYwd9SwbtGqsQ8nHJmtNM=;
        b=kZIwdLLKqZOzlh+QgIIMltQmCJo/0Dc5WMcobcVf6OP7Lh7KTN7rU9XXBfMciYi9wr
         4JVbOt6RuWHMlh3ZrPqPKNQZtUGh5qzqPmSVQd6lSMaXfdlNsfW3gCNW2PbNPuxJ71C0
         2yVqVB6w8L71X05pWfI3nqS8ZCFLBrXeKXuUXo3yu5vPEU98UocRnOsf7cWH3WmrOjxe
         mAXd/l1wAdvX2TmKChjUVohChs0945nV+F5TPQaxe0kHmOIA5bs0QwrRD33tWs9sdAr2
         mQyXiHtmV60/G10T92qIt6P8zvtgN4fZteUlo9Sq+zXDU1gcEfn7Xzvmn66edSmdSusp
         DyuQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9l4WHt4ysBqb6L29VuQDJl0vXBPlGfA/i6vYGKVtqNCwLXIWjbe7ZLuq45MfEnoSY151Fvg4lVzA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwoR/4R6clyiuLinF9D6ImfT/o+/31mtxG7hemlUlxDw6lyEjUf
	jGq7a64kv07F4wvOp0RtOxJZlpKq2mRQXooR4a9mmOGSO5vLEg3b8T/dqYQIdxazr7FHGC9U5tD
	X8y1pGllMGnbaft8y/29HkbMYhADTv6rE0GGjxSblCQ==
X-Gm-Gg: ATEYQzx2BxHtCVQEwGEqLLy9aCmxRnkp3qxU6qyAvqEFr/0iSCX6kwFY+tZjB/eFMxM
	TbUPJKVQV4YdqL5qHykCCfnFQHdsm72otUfLjU8u9IH4c1EA6FYXpJaL7CER+BZdB9q4MPLK4AC
	eAj38czYcmAxyR+fQ8N8evbazw0U/X1fg5WCocmDoK+4RjzzBfnpFCerRWJU5XASZAjjA7fsAHD
	pMTyRm+ybFCz9cIMCx0fHMaIvCIH9uVVCe3wwRODZx/7I5oAuxsq9XxxrAUJ6QEEmHppBgxIpig
	FRfBVbVSaCyKGliV325L9YtUaQtIvtNe79qow020z7OQHqve7B4HD+NVXAVWACQ6LC4oGGKvZ2n
	Ea+IRWDaYsqpbCnZB4LKsuybgWQ==
X-Received: by 2002:a05:6808:4f29:b0:467:32c1:acf1 with SMTP id
 5614622812f47-46a8a574768mr975177b6e.39.1774617389039; Fri, 27 Mar 2026
 06:16:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260316151612.13305-1-osama.abdelkader@gmail.com>
In-Reply-To: <20260316151612.13305-1-osama.abdelkader@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 27 Mar 2026 18:46:17 +0530
X-Gm-Features: AQROBzAiBWQwzRrAsNPun8GkheFgn7uHFWTVjZzHMuhgO-eFGjXm39iFGnN1dNM
Message-ID: <CAAhSdy1c=Bvso+ZCy_6a_1Bh8sznGDs9wErPQdqGWepgq8nQsg@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: kvm: fix vector context allocation leak
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vincent Chen <vincent.chen@sifive.com>, Andy Chiu <andybnac@gmail.com>, 
	Greentime Hu <greentime.hu@sifive.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_061630_350201_4B3DECB4 
X-CRM114-Status: GOOD (  16.06  )
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

T24gTW9uLCBNYXIgMTYsIDIwMjYgYXQgODo0NuKAr1BNIE9zYW1hIEFiZGVsa2FkZXIKPG9zYW1h
LmFiZGVsa2FkZXJAZ21haWwuY29tPiB3cm90ZToKPgo+IFdoZW4gdGhlIHNlY29uZCBremFsbG9j
IChob3N0X2NvbnRleHQudmVjdG9yLmRhdGFwKSBmYWlscyBpbgo+IGt2bV9yaXNjdl92Y3B1X2Fs
bG9jX3ZlY3Rvcl9jb250ZXh0LCB0aGUgZmlyc3QgYWxsb2NhdGlvbgo+IChndWVzdF9jb250ZXh0
LnZlY3Rvci5kYXRhcCkgaXMgbGVha2VkLiBGcmVlIGl0IGJlZm9yZSByZXR1cm5pbmcuCj4KPiBG
aXhlczogMGY0YjgyNTc5NzE2ICgicmlzY3Y6IEtWTTogQWRkIHZlY3RvciBsYXp5IHNhdmUvcmVz
dG9yZSBzdXBwb3J0IikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYt
Ynk6IE9zYW1hIEFiZGVsa2FkZXIgPG9zYW1hLmFiZGVsa2FkZXJAZ21haWwuY29tPgoKUXVldWVk
IHRoaXMgcGF0Y2ggZm9yIExpbnV4LTcuMQoKVGhhbmtzLApBbnVwCgo+IC0tLQo+IHYyOgo+IC0g
QWRkIEZpeGVzOiB0YWcKPiAtIEFkZCBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IC0tLQo+
ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3ZlY3Rvci5jIHwgNSArKysrLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rdm0vdmNwdV92ZWN0b3IuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfdmVjdG9yLmMKPiBp
bmRleCAwNWYzY2MyZDhlMzEuLjViNmFkODJkNDdiZSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2
L2t2bS92Y3B1X3ZlY3Rvci5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV92ZWN0b3IuYwo+
IEBAIC04MCw4ICs4MCwxMSBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfYWxsb2NfdmVjdG9yX2NvbnRl
eHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01F
TTsKPgo+ICAgICAgICAgdmNwdS0+YXJjaC5ob3N0X2NvbnRleHQudmVjdG9yLmRhdGFwID0ga3ph
bGxvYyhyaXNjdl92X3ZzaXplLCBHRlBfS0VSTkVMKTsKPiAtICAgICAgIGlmICghdmNwdS0+YXJj
aC5ob3N0X2NvbnRleHQudmVjdG9yLmRhdGFwKQo+ICsgICAgICAgaWYgKCF2Y3B1LT5hcmNoLmhv
c3RfY29udGV4dC52ZWN0b3IuZGF0YXApIHsKPiArICAgICAgICAgICAgICAga2ZyZWUodmNwdS0+
YXJjaC5ndWVzdF9jb250ZXh0LnZlY3Rvci5kYXRhcCk7Cj4gKyAgICAgICAgICAgICAgIHZjcHUt
PmFyY2guZ3Vlc3RfY29udGV4dC52ZWN0b3IuZGF0YXAgPSBOVUxMOwo+ICAgICAgICAgICAgICAg
ICByZXR1cm4gLUVOT01FTTsKPiArICAgICAgIH0KPgo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0K
PiAtLQo+IDIuNDMuMAo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2t2bS1yaXNjdgo=
