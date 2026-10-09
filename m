Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F335CA601D
	for <kvm-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 16:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0iNbHf7KdZd2AmaQdractdB2BtiH7g2SNMtFSIDABAs=; b=2nnsOLT5Y3hEp6
	MVLqDUbFgI3391dcjnrS6TASs9ljXt/cvjWnnn+Ju2E1izT5CK89TymK/lX5emGfyUXbh4Fib30yP
	W2EYR8Z6Jdc8iMdOejdyDlDz+72EfsTUFwplmrw5L1SmI5ywTKzHVcSYAkof00beupkxNz3PYoZra
	VUpl4UGveDP3D0nVlWoN6GzuFG0DA0lhYzh5Gfu7SqDDDtjHrOkkR08HZYE0Cnlal3dX9chIdmuyb
	5kMK8AqWjzlCQIzQm0/cznSMtmMCpXTKls60rWmZeFArB7px8KsipNL/Y40A+ze/iH9Sjd9yGw+xI
	0/203+g4UCKVfnW/jP2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDb8-00000006feE-3GWK;
	Fri, 09 Oct 2026 16:37:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDb7-00000006fdj-1d4R
	for kvm-riscv@bombadil.infradead.org;
	Fri, 09 Oct 2026 16:37:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZcD3lWBEn/k5gS7QyncQIx9YliZr40hzwE5JijjRb3o=; b=iv7MlNs6Ob6VWmzQXTq7cQvkbk
	m0HmjQ6hSf4Op3cAxLUAAZXAhxNczVEERU0VKOYDg8NpKiTOAhI9RsocnyE23aBUWstzWezOdC7R8
	1P4Vbf4cPa0C3R/OGG2BH5vfEWRd3lVQp88Mb+rHeusrxLyrLIJytnITAOxg0tFrZmfadJj4KK4FS
	Q2y+IUMAafhd96UcWRTgSFoPOgzL/EtN6AYM3d4T6Db7tLNDSQWqo2Yt48BQ3omL33aRZ/4pHEE6z
	E+pXc4aORsvihc1ZbU48d3MqN0j/mJqNMXs2CeO5Xvfe7F9Ws9dzx+myRH17i/BJW4cZkhFa2xkj6
	7nEvlcNg==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xFDb4-0000000BQ7g-1gtx
	for kvm-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 16:37:28 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48c14a06c95so3520821f8f.1
        for <kvm-riscv@lists.infradead.org>; Fri, 09 Oct 2026 09:37:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791563845; cv=none;
        d=google.com; s=arc-20260327;
        b=PiplpLiQ2f3kkQP3q8AdRu26BrbXBjLb8ystHFkgKTiizFIjDQ0cc+W0P4uEnZxsv9
         6ABANCCrnIqocZsAXVD3QlP3NYZZRlqwe6lq861PWR0NN32OcDdwFSZxj5BLD04ZIjCk
         7WLIattv72/kVScURR2ZgkhEzsLYbdBYlF8EF6kE7iE+zn2BdiMs+rzo56P0J1UuvMUn
         g+0+KReOQmANwzJjrxwhe++4BhZdHpPNB1VRG8Byf0vFU/d6ww8IJ4fWQCSUpgjbZFMI
         jaAFMOF2pRn92kKGq3SXD9lBrqxyhIrzPUwY/wuMJSpc5nZ1LzBeHOq6DvrPaMtHOzS/
         JZKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZcD3lWBEn/k5gS7QyncQIx9YliZr40hzwE5JijjRb3o=;
        fh=Iv2ws9j5Svu3nnAMsZmQbepRFX4CJrNjztUWG9MzRuI=;
        b=lxEah9e7Q0jSlJaFC642PHdM4k9SnDwKY5+J5Qwz96w+eG/xcXqlfouGhbD88XlUlK
         V2mrywG1uqb8XV133TWmaKGmitFVVkZqOlRDdCeXUgERaEC7hN/oU7o9xYtRT+Suw1Xc
         TEZUg72mBRA/3lFbekfNeRwqWCiCCwc/oBrK9q9ou0xGWdRM1XNxSToMKEOhISaM5mHi
         233+4T9zaiV08dm2721zv4mbYjfvIkGJf1j++lSLg7TpIcK1FEJZTcKVocW+3zE5tIc/
         oicOA/bnEQwvcKFKCj/94Fw46p+M83wcL8IT3O6zH1XE7tFTK+w9EK/tPrW22olEJQK4
         4EMA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791563845; x=1792168645; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZcD3lWBEn/k5gS7QyncQIx9YliZr40hzwE5JijjRb3o=;
        b=e/xEuQXlPUnL/zTzn0TFV35kKG2dtONXPeCRcloqGX7N70oK0EJLlk8znugnrP2cOC
         K/7EPaukJLdrdPJtHucxksYAn9WJSxywi0NQpFUoDEcBKvA2Q9YiW/FU+wXJjLYKVB1g
         v9VuGpqflcUmQRO9aI4SrH0paLKiOpDSHFx4xT4p8ixLrprDxZcUanDb/WX0XdYmFxxL
         REbxNHbxc2onW9N1EPujdOtlxT2it/K7S0pqFLyiKswdWk8UGQkn1M+aN6WWWA96Sxc2
         g0N+1s6AlBWzixRxEty410nrwk0KEcvbvinOtV5RzFBOf3EckrLyLoh/qkOPZOly0xC8
         mWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791563845; x=1792168645;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZcD3lWBEn/k5gS7QyncQIx9YliZr40hzwE5JijjRb3o=;
        b=uqMd17IpYYVtum4hCv8IxUPtR/OpkfgQyDM8lNwbZGOLoOmHuaqOXS7l7sH3pAQM7y
         0Xghpp256acpVXXB9lfW/vKqMuMsmxVq05/q7KhB6WXx89zJQtDMHMSuvUbcmQVSs0fz
         zm6ykfWpdcna1NLmQp+F1Nmim0FqtuVEEpwl8RGJEse3fTWzlZS7655tJWFNyiA5YHDa
         t/Am/6jNt4tM7SkD6rm3f3p1eP2vbIfWJdVYfshHXmIMFYA5RH0R4f1zvzfug9iK7HoI
         gJ/Naj3eI0w0Q0gCDVlQKmICvfig40TsZLqMFPkJOMPZ+k4JtUFJyuExC11QbCpb2FQf
         WSEQ==
X-Gm-Message-State: AFq9FYJYrkTsEdYUpEVnE2N4J6QZfMwpj1KK/aCneYTyEGySNiQqikjP
	oWFA1yu8a/rwLcxaD7PGeo3ZuNF7/cKAAoQiYfQWHLMT+GRqB9wgmKAoa5pFX6QHZRp7xJtzmRU
	BDo00HyY+55HCF/yE6R1rnRhzKfAckuxrk4HfWIFoEQ==
X-Gm-Gg: AYBFou0918HXM+Tj4FXMLC31HykWCSj2PLco6Hq+TTATNx9gcmBKGoqRAW7Dsp81NJi
	csSlBO8TmGYWlejptG1nL7gbgNjGTAmc7vLLy+1hsgENvCNAtoh5A308csV+t9pQ2C5lTm9f52N
	HNuMRdnoivniOkhTYrLc7pITx2ETQSDcY1QRpMNeNeC2egYCPcvDH90XthOE2wEaEBxoHIMlacl
	WixfqgGF4BbdTeK2VQrc5uKbS4rAA0HTVTwQQ7WiNML74VYPjKkD+3p1ZIjS+0xQlzkSZqc6RfX
	X8JmxidhEm2etS0YniCD0TJl4qJbHvZL1M/+Nq1P5cyeki8a0tZPQ5Hb1IcPYVM8MDNkKmFKeCc
	ifrriRb8gkFC1i1f0cB5o60nzYl78V933diKu2r5rD7rbHIL5RDD/KRus6Pdi280jU3ejGCQLpg
	==
X-Received: by 2002:a05:6000:46db:b0:48c:652b:9694 with SMTP id
 ffacd0b85a97d-48dbaadd069mr3527485f8f.14.1791563844566; Fri, 09 Oct 2026
 09:37:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260925155116.465203-1-andrew.jones@oss.qualcomm.com>
 <CAAhSdy0Y8kQ=gsiX0QX6Ntq=fL89METhA0s7G3niBBJrHpue7A@mail.gmail.com> <7zy352odf4hekcibmio3atunubffzxfcsqnn55q6sfkksnynfj@5bx263nnizdm>
In-Reply-To: <7zy352odf4hekcibmio3atunubffzxfcsqnn55q6sfkksnynfj@5bx263nnizdm>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 9 Oct 2026 18:37:13 +0200
X-Gm-Features: AclHuK8vtPQ4aaw6JsQ85iwGdZHaeULxx6XNPczP994xQTrZFbfymhhY5wrwX9c
Message-ID: <CAAhSdy2mAs6UgTk-hbGd3DX_1242Jpy9WLnOp6kmPvVVtABWHw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Use a raw lock for IMSIC wakeup state
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: kvm-riscv@lists.infradead.org, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_173726_758352_B36E6BC6 
X-CRM114-Status: GOOD (  16.05  )
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

T24gRnJpLCBPY3QgOSwgMjAyNiBhdCAzOjQ04oCvUE0gQW5kcmV3IEpvbmVzCjxhbmRyZXcuam9u
ZXNAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBIaSBBbnVwLAo+Cj4gT24gRnJpLCBPY3Qg
MDksIDIwMjYgYXQgMDE6NDU6MjBQTSArMDIwMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+IE9uIEZy
aSwgU2VwIDI1LCAyMDI2IGF0IDU6NTHigK9QTSBBbmRyZXcgSm9uZXMKPiA+IDxhbmRyZXcuam9u
ZXNAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IGt2bV9yaXNjdl92Y3B1X2Fp
YV9pbXNpY19wdXQoKSBjYW4gcnVuIGZyb20gdGhlIHNjaGVkdWxlciBwcmVlbXB0aW9uCj4gPiA+
IG5vdGlmaWVyIHdoaWxlIHRoZSByYXcgcnVucXVldWUgbG9jayBpcyBoZWxkLiBUYWtpbmcgdnNm
aWxlX2xvY2ssIGFuCj4gPiA+IHJ3bG9ja190LCB0aGVyZSB2aW9sYXRlcyB0aGUgbG9ja2RlcCB3
YWl0LWNvbnRleHQgcnVsZXMuCj4gPiA+Cj4gPiA+IFByb3RlY3QgdGhlIENQVS9IR0VJIHBhaXIg
d2l0aCBhIHNlcGFyYXRlIHJhdyBzcGlubG9jay4gQWxsIHVwZGF0ZXMgdG8KPiA+ID4gdGhhdCBw
YWlyIHJldGFpbiB2c2ZpbGVfbG9jayBhbmQgdGFrZSB0aGUgbmV3IGxvY2ssIHdoaWxlIHNjaGVk
dWxlci1vdXQKPiA+ID4gdXNlcyBvbmx5IHRoZSBuZXcgbG9jayBhcm91bmQgdGhlIEhHRUlFIHVw
ZGF0ZS4gVGhpcyBrZWVwcyB0aGUgd2FrZXVwCj4gPiA+IHNldHVwIHNlcmlhbGl6ZWQgd2l0aCBW
Uy1maWxlIHB1YmxpY2F0aW9uIGFuZCByZWxlYXNlIHdpdGhvdXQgYnJpbmdpbmcKPiA+ID4gd2lk
ZXIgSU1TSUMgb3BlcmF0aW9ucyBpbnRvIGEgcmF3IGNyaXRpY2FsIHNlY3Rpb24uCj4gPgo+ID4g
SW5zdGVhZCBvZiBpbnRyb2R1Y2luZyBhbm90aGVyIGxvY2ssIHdoeSBub3QgcmVwbGFjZQo+ID4g
cmVhZF9sb2NrX2lycXNhdmUoJmltc2ljLT52c2ZpbGVfbG9jaywgZmxhZ3MpIHdpdGgKPiA+IHdy
aXRlX2xvY2tfaXJxc2F2ZSgmaW1zaWMtPnZzZmlsZV9sb2NrLCBmbGFncykgaW4KPiA+IGt2bV9y
aXNjdl92Y3B1X2FpYV9pbXNpY19wdXQoKSA/Pwo+Cj4gVW5mb3J0dW5hdGVseSwgd3JpdGVfbG9j
a19pcnFzYXZlKCkgaGFzIHRoZSBzYW1lIFBSRUVNUFRfUlQgaXNzdWUsIHNpbmNlCj4gcndsb2Nr
X3QgaXMgc2xlZXBhYmxlIG9uIFJUIGluIGJvdGggbW9kZXMuCj4KCkkgYW0gbm90IGZvbmQgb2Yg
bmVzdGVkIGxvY2tpbmcsIHdoeSBub3QgY29udmVydCB2c2ZpbGVfbG9jayBpbnRvIHJhdwpzcGlu
bG9jayA/PwoKUmVnYXJkcywKQW51cAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9rdm0tcmlzY3YK
