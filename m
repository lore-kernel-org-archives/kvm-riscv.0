Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FA5CA6019
	for <kvm-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 10:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bwHGTCgPgSolUOEPM+3BCBw/EsqUP5Ye7BBlgtWx5HA=; b=V5k5dohgQYGQfI
	mzodnMWnpUvI+G5cifoCOgXpZC5DlCw6uudx+81V9tQ4ceerffPCU7z2HB3UcxCuAAoFkndM8Zhh7
	q72HbNpI7mU9buS65OzgFWMlk51WYAdKjIKy8V2jmNa+EaVoUGyh1ZkhOzS2hhFzULfSiJizUCWzq
	r9diH2YeT6g+FqQx1oO6ApNSwtKLyuKPpwBmgBMKCTq4auwhtD/lOyuKzkjw2cSSKOE+WXn+DMyC5
	zokbF2r+VxuPmjb65Oaqz+H0yAh+ZDFzjcMT4odIkmdVBYJiSHgEOCGNM0EcrMqUJ5CbQlIn07GNK
	N3hvpRXi4/04S2mytWSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7Vx-00000005ymd-01S0;
	Fri, 09 Oct 2026 10:07:45 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7Vt-00000005ylN-0vPO
	for kvm-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 10:07:42 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48bbb06e746so3352313f8f.3
        for <kvm-riscv@lists.infradead.org>; Fri, 09 Oct 2026 03:07:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791540459; cv=none;
        d=google.com; s=arc-20260327;
        b=ZQlBT2cRy+jqfslxz6gIhOI6lQvwSoTUP6qWH+LXYV2T0CCxiTSn5QLIWN2dJpXUwE
         FDVcFcfBarmqfKKZuwaC0nyIUpvlaRXxTgDVab+YWiTt/vv3LIpFV6KjvABs0NXX1Fil
         Zt7VvyXo/v/R9y3daGUnZL0gW3h12ugA8Cd6/+wUHH/9GxBpCvgbWd90/qqi/dpKysjt
         m5MrIR97JkYZfcYk0no08+u5SO+GyNOZauog/ehPXT5HOEebsop8HcmmDyJ3BVkaDGMu
         wHb9mdzuCY+7SNmNWHMBoP5WlKIKbRaqzCLI/h00yHUruaR8QwSURngDGTo++btkVYIC
         Nsng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YhlTmiSSnyAhAbjv/VolTrl3XZ08TdurV9y8UvnnMXY=;
        fh=EFnNigN4mGaUPIDKzKwL7JZh6oKxxpf7HBr736iM0SA=;
        b=SmbgiMIROqciv++46H/rffIciHdnvf+93DS2kvw/ujyrBnO96P+8pAY9K3A5cCNsI2
         yuyKAT/DaWgMNApQr9gQyAZMLoKj1ud0HL9C4UX0YkEthPKLMbbpHFm3A77GTOrXqqLN
         /KarZ1vol11+D1lVwKoxq8pe3kcI2XxXCjkUXFlZk1N84eq+SJbVJX9teqG8qtRdgTsn
         A2WeziZKp8HwbrcETXSfe1pkxDZtppiJxBaMD5qzL3+usUHG8z5uAPNGJM9gyOTbhtYg
         39fumMJVvMduzgYZgzW25GcnmqHqQ6BR6ZBl1ki08mfJvpaTx8Q2pHUWPa6LNFp6lRlB
         20YQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791540459; x=1792145259; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YhlTmiSSnyAhAbjv/VolTrl3XZ08TdurV9y8UvnnMXY=;
        b=eB15jw7BTdKp/h7LPkvyMZtiPsj17fb14H5qNFJlDkBhiGqtNLu6TZeVKya/OTpfuo
         fsJKOZl4zJ/zDXSW7vpkUGHCX3+ZfKeVcYEDFDzI7zsCMMvCG62HW8ZsznG4OGH3OFfp
         FGQ3brj0AFHKLHZd4ybyskk8++D2iclasT87hxtEvsSyRUUXDqROWmEdC3BdD5jq6co6
         o4Q9UiR45HoI8J2KlimJZ8KNRAoJ5HJeq1rmAGLL+93EM732PTXdVYsdQtEWkKK3hwY5
         emIWL6hbk3MlK23NJD8iFYPsaiAxWQoy0dKiwZU7wC9ac4rAbmvup2/MXU7FdA1fmjZX
         IybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540459; x=1792145259;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YhlTmiSSnyAhAbjv/VolTrl3XZ08TdurV9y8UvnnMXY=;
        b=EGgfWRL02h6m0GNf0/0ZK/g5L/8cJYMGVeCmYe8zdmMualvFz9uUBS3sKT5Kuddx+B
         yYXyIA8Xqb9Ut9Xlx2kxtoyNN+Bb5batBM5HA9w7C52AflNstZEhZ6eOEwU1AUCDHKVe
         6WUxHcUFRlUtlZORg8+I0TbKILPnK2INRYTK95AuRbIZJ0MGjtqVyd2/78Ddf84P2zzJ
         DTA/+OnD0Mf9mIvTj0FJ3mnn4EBxJfCUEBlFMstza8wU/uSy1CTEi1tdy00tIlWbORJK
         +j64liNk/IjMA24Tr+PFmDPpy5yPnV100FQsSgbIXiLEJMTJ03JMMPZBotT9zqDMKPud
         KH5g==
X-Forwarded-Encrypted: i=1; AKwUvBzjok/Dgzb8Zq1kOQIBf8hsYSojjYj1etLI+AfBB3POdOLsmz7FfKdWjyvjjIXO6eV6fu5D+3uXuwg=@lists.infradead.org
X-Gm-Message-State: AFq9FYIauqmi5iklACD/tvqgHPnwoOBvul3PUPBeg1t06bfOd/4XDAgX
	r2S/Upofu9fGbW97WrTKxEGDbUZW+P0KdYjABs2pQkixShXxyMUoAvXxMkkq7qyHo4RhnhkHVes
	rAmSjCT+uCpGafAEZEAYB567SnkpousMVYa3jHJ1KXQ==
X-Gm-Gg: AYBFou0wVFtKJ7V2mllB2+wL8U8OmPgk7nn1mKuGTi1tlvy4oj9QwboeW7TybCYk3Qi
	lhl/FlD2ZmAyXtRO76bCJCE1lHfz6IdydQcax3R+HFhUa6Uls/mSF/nTTM/abEe+p01KnZgRkkc
	AkBvBREPqjAgqHQLNNPFH0Nk/kpUDdgRAEI2pSG20j458hXybjuUwwrdTTHVaUE+5XIQb3+8SZX
	/Migun4Nh8L8SrKJpNEyT+RJ+EX34z2Q0ftocpURvibrC7jL3NNwgmA2TiTKGz+YPj8BnocDf+L
	PLu48+EyFgKvKJuAiyPujZ24auU081YWFOfQ2nwporjidki0VR272BHv8CfbEAyrQqN8p0C25xV
	h4dHB/LSMr9qT+PIozls+gXlFS4GdDH6cp9z8oME8W9XA7aeUbHlyINsPWvva1G5EQ1kJGKcRng
	==
X-Received: by 2002:a5d:5d83:0:b0:48a:efed:ac97 with SMTP id
 ffacd0b85a97d-48dba9d326amr2435668f8f.33.1791540458537; Fri, 09 Oct 2026
 03:07:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260831-kvm_kselftest_dump-v1-1-55b022c6ef8e@sifive.com>
In-Reply-To: <20260831-kvm_kselftest_dump-v1-1-55b022c6ef8e@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 9 Oct 2026 12:07:26 +0200
X-Gm-Features: AclHuK8s2qRUsbqTNG8YPqEmgy3yDujBoTHugKHr0lrqk5zZyltW7DxQdyuRR9k
Message-ID: <CAAhSdy3TOK6B5SUpFs+dQBzfLDy3-otMxTPEPwzOsoNsqY3cKg@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: selftests: Dump sepc/scause/stval on vcpu_arch_dump()
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, greentime.hu@sifive.com, 
	vincent.chen@sifive.com, zong.li@sifive.com, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_030741_293412_5BD9EE7D 
X-CRM114-Status: GOOD (  13.78  )
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

T24gVHVlLCBTZXAgMSwgMjAyNiBhdCA1OjU34oCvQU0gWW9uZy1YdWFuIFdhbmcgPHlvbmd4dWFu
LndhbmdAc2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiB2Y3B1X2FyY2hfZHVtcCgpIG9taXRzIHRyYXAt
cmVsYXRlZCBDU1JzLCBtYWtpbmcgaXQgaGFyZCB0byBkaWFnbm9zZQo+IHVuZXhwZWN0ZWQgZ3Vl
c3QgZXhjZXB0aW9ucyBmcm9tIHRoZSBkdW1wIG91dHB1dCBhbG9uZS4KPgo+IFByaW50IHNlcGMs
IHNjYXVzZSwgYW5kIHN0dmFsIGFsb25nc2lkZSB0aGUgZXhpc3RpbmcgcmVnaXN0ZXIgZHVtcC4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFlvbmctWHVhbiBXYW5nIDx5b25neHVhbi53YW5nQHNpZml2ZS5j
b20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+
CgpRdWV1ZWQgdGhpcyBwYXRjaCBmb3IgTGludXgtNy40CgpUaGFua3MsCkFudXAKCgo+IC0tLQo+
ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL3Jpc2N2L3Byb2Nlc3Nvci5jIHwgOCAr
KysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0
IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYyBiL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIvcmlzY3YvcHJvY2Vzc29yLmMKPiBpbmRleCBk
ZWQ1NDI5ZjM0NDguLmJmMzU1YWZhODQ4NiAxMDA2NDQKPiAtLS0gYS90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9rdm0vbGliL3Jpc2N2L3Byb2Nlc3Nvci5jCj4gKysrIGIvdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYwo+IEBAIC0yMzUsNiArMjM1LDcgQEAg
dm9pZCByaXNjdl92Y3B1X21tdV9zZXR1cChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gIHZvaWQg
dmNwdV9hcmNoX2R1bXAoRklMRSAqc3RyZWFtLCBzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHU4IGlu
ZGVudCkKPiAgewo+ICAgICAgICAgc3RydWN0IGt2bV9yaXNjdl9jb3JlIGNvcmU7Cj4gKyAgICAg
ICBzdHJ1Y3Qga3ZtX3Jpc2N2X2NzciBnZW5lcmFsX2NzcjsKPgo+ICAgICAgICAgY29yZS5tb2Rl
ID0gdmNwdV9nZXRfcmVnKHZjcHUsIFJJU0NWX0NPUkVfUkVHKG1vZGUpKTsKPiAgICAgICAgIGNv
cmUucmVncy5wYyA9IHZjcHVfZ2V0X3JlZyh2Y3B1LCBSSVNDVl9DT1JFX1JFRyhyZWdzLnBjKSk7
Cj4gQEAgLTI3MCw2ICsyNzEsMTAgQEAgdm9pZCB2Y3B1X2FyY2hfZHVtcChGSUxFICpzdHJlYW0s
IHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdTggaW5kZW50KQo+ICAgICAgICAgY29yZS5yZWdzLnQ1
ID0gdmNwdV9nZXRfcmVnKHZjcHUsIFJJU0NWX0NPUkVfUkVHKHJlZ3MudDUpKTsKPiAgICAgICAg
IGNvcmUucmVncy50NiA9IHZjcHVfZ2V0X3JlZyh2Y3B1LCBSSVNDVl9DT1JFX1JFRyhyZWdzLnQ2
KSk7Cj4KPiArICAgICAgIGdlbmVyYWxfY3NyLnNlcGMgPSB2Y3B1X2dldF9yZWcodmNwdSwgUklT
Q1ZfR0VORVJBTF9DU1JfUkVHKHNlcGMpKTsKPiArICAgICAgIGdlbmVyYWxfY3NyLnNjYXVzZSA9
IHZjcHVfZ2V0X3JlZyh2Y3B1LCBSSVNDVl9HRU5FUkFMX0NTUl9SRUcoc2NhdXNlKSk7Cj4gKyAg
ICAgICBnZW5lcmFsX2Nzci5zdHZhbCA9IHZjcHVfZ2V0X3JlZyh2Y3B1LCBSSVNDVl9HRU5FUkFM
X0NTUl9SRUcoc3R2YWwpKTsKPiArCj4gICAgICAgICBmcHJpbnRmKHN0cmVhbSwKPiAgICAgICAg
ICAgICAgICAgIiBNT0RFOiAgMHglbHhcbiIsIGNvcmUubW9kZSk7Cj4gICAgICAgICBmcHJpbnRm
KHN0cmVhbSwKPiBAQCAtMjk2LDYgKzMwMSw5IEBAIHZvaWQgdmNwdV9hcmNoX2R1bXAoRklMRSAq
c3RyZWFtLCBzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHU4IGluZGVudCkKPiAgICAgICAgIGZwcmlu
dGYoc3RyZWFtLAo+ICAgICAgICAgICAgICAgICAiIFQzOiAweCUwMTZseCAgIFQ0OiAweCUwMTZs
eCBUNTogMHglMDE2bHggVDY6IDB4JTAxNmx4XG4iLAo+ICAgICAgICAgICAgICAgICBjb3JlLnJl
Z3MudDMsIGNvcmUucmVncy50NCwgY29yZS5yZWdzLnQ1LCBjb3JlLnJlZ3MudDYpOwo+ICsgICAg
ICAgZnByaW50ZihzdHJlYW0sCj4gKyAgICAgICAgICAgICAgICJTRVBDOiAweCUwMTZseCBTQ0FV
U0U6IDB4JTAxNmx4IFNUVkFMOiAweCUwMTZseFxuIiwKPiArICAgICAgICAgICAgICAgZ2VuZXJh
bF9jc3Iuc2VwYywgZ2VuZXJhbF9jc3Iuc2NhdXNlLCBnZW5lcmFsX2Nzci5zdHZhbCk7Cj4gIH0K
Pgo+ICBzdGF0aWMgdm9pZCBfX2FsaWduZWQoMTYpIGd1ZXN0X3VuZXhwX3RyYXAodm9pZCkKPgo+
IC0tLQo+IGJhc2UtY29tbWl0OiBiNTA2MGE0YWEzM2Q3ZDc4YThjMTgzN2FiMDhlZjBjODFlYTk2
NjUwCj4gY2hhbmdlLWlkOiAyMDI2MDgzMS1rdm1fa3NlbGZ0ZXN0X2R1bXAtM2Y4ZDRkYWY1YzYw
Cj4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2
Cg==
