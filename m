From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 13 Jan 2023 08:25:31 +0100
Subject: [PATCH v2 03/11] RISC-V: KVM: Return correct code for hsm stop
 function
In-Reply-To: <CAHBxVyFokVx0C+a8LvYrftE=JwuDAHgPRmhMQFtV9LHGqMuJgA@mail.gmail.com>
References: <20221215170046.2010255-1-atishp@rivosinc.com>
 <20221215170046.2010255-4-atishp@rivosinc.com>
 <20230112102839.rsabb2bah5lkkx4e@orel>
 <CAHBxVyFokVx0C+a8LvYrftE=JwuDAHgPRmhMQFtV9LHGqMuJgA@mail.gmail.com>
Message-ID: <20230113072531.xgg5e3rwdjvx7afy@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 12, 2023 at 10:25:06AM -0800, Atish Kumar Patra wrote:
> On Thu, Jan 12, 2023 at 2:28 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Thu, Dec 15, 2022 at 09:00:38AM -0800, Atish Patra wrote:
> > > According to the SBI specification, the stop function can only
> > > return error code SBI_ERR_FAILED. However, currently it returns
> > > -EINVAL which will be mapped SBI_ERR_INVALID_PARAM.
> >
> > I presume the mapping referred to here is kvm_linux_err_map_sbi().
> > If so, then -EPERM isn't correct either. That maps to SBI_ERR_DENIED.
> > The only thing that will ensure we get SBI_ERR_FAILURE (-1) is
> > anything not handled by the kvm_linux_err_map_sbi switch, as we
> > need to use the default.
> >
> 
> It returns SBI_ERR_FAILURE in the next patch when kvm_linux_err_map_sbi
> is removed. Maybe I should drop this patch. The next patch does the
> correct thing anyways.

Yeah, I saw that, but then we silently fix a bug in the next patch.
I like that this is a separate patch, but it should do what it says
it's doing :-)

Thanks,
drew

